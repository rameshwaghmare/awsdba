#!/u01/app/oracle/product/12.2/client_1/bin/perl/bin/perl
###############################################################################
# transfer_dump.pl
#
# PERL script to transfer a file from the local linux server to an
# RDS Oracle database instance.
#
# To run:  ./transfer_dump.pl <filename>
#
###############################################################################
# NOTE:  Modify the RDS tnsnames.ora alias, username, and password
#        on the DBI->connect() line below before running
###############################################################################

my $dirname = "DATA_PUMP_DIR";
my $fname = $ARGV[0];
my $data = "dummy";
my $chunk = 8192;

my $sql_open    = "BEGIN perl_global.fh := utl_file.fopen(:dirname, :fname, 'wb', :chunk); END;";
my $sql_write   = "BEGIN utl_file.put_raw(perl_global.fh,:data, true); END;";
my $sql_close   = "BEGIN utl_file.fclose(perl_global.fh);END;";
my $sql_global  = "create or replace package perl_global as fh utl_file.file_type; end;";

use DBI;
# SUBSTITUTE YOUR RDS TNSNAMES.ORA ALIAS, USERNAME, AND PASSWORD ON THIS LINE
my $conn = DBI->connect("dbi:Oracle:orcldb",'rdsdba','pass23word') || die ( $DBI::errstr ."\n");

my $updated=$conn->do($sql_global);
my $stmt = $conn->prepare ($sql_open);
$stmt->bind_param_inout(":dirname",\$dirname, 12);
$stmt->bind_param_inout(":fname",\$fname, 12);
$stmt->bind_param_inout(":chunk",\$chunk, 4);
$stmt->execute() || die ( $DBI::errstr . "\n");

open (INF, $fname) || die "\nCan't open $fname for reading: $! \n";
binmode(INF);
$stmt = $conn->prepare ($sql_write);
my %attrib = ('ora_type','24');
my $val=1;
while ($val > 0) {
        $val = read (INF, $data, $chunk);
        $stmt->bind_param(":data", $data ,\%attrib);
        $stmt->execute() || die ( $DBI::errstr . "\n"); };
die "Problem copying: $!\n" if $!;
close INF || die "Cant close $fname: $!\n";
$stmt= $conn->prepare ($sql_close);
$stmt->execute() || die ( $DBI::errstr . "\n");
