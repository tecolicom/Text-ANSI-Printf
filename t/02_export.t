use strict;
use warnings;
use utf8;
use open IO => ':utf8', ':std';
use Text::ANSI::Printf qw(ansi_printf ansi_sprintf);

#use Getopt::EX::Colormap qw(colorize);
use Term::ANSIColor qw(colored);
sub r {
    local $_ = shift;
#   s/(\S+)/colorize('R', $1)/er;
    s/(\S+)/colored($1, 'red')/er;
}

use Test::More;

is( ansi_sprintf( "%d %5.3f", 12345, 12.345),
    "12345 12.345",
    'Number %d %f' );


is( ansi_sprintf( "%12s",    r("abcde")),  r("       abcde"), 'ASCII %s' );


is( ansi_sprintf( "%12s",    r("あいうえお")),  r("  あいうえお"), 'wide %s' );
is( ansi_sprintf( "%12s",   r("aあいうえお")),  r(" aあいうえお"), 'wide %s' );
is( ansi_sprintf( "%12s",  r("aaあいうえお")),  r("aaあいうえお"), 'wide %s' );
is( ansi_sprintf( "%12s", r("aaaあいうえお")), r("aaaあいうえお"), 'wide %s' );

is( ansi_sprintf("%-12s",    r("あいうえお")), r("あいうえお  ") , 'wide %-s' );
is( ansi_sprintf("%-12s",   r("aあいうえお")), r("aあいうえお ") , 'wide %-s' );
is( ansi_sprintf("%-12s",  r("aaあいうえお")), r("aaあいうえお") , 'wide %-s' );
is( ansi_sprintf("%-12s", r("aaaあいうえお")), r("aaaあいうえお"), 'wide %-s' );

is( ansi_sprintf( "%7s",   r( "ｱｲｳｴｵ")),  r("  ｱｲｳｴｵ"), 'half %s' );
is( ansi_sprintf( "%7s",   r("aｱｲｳｴｵ")),  r(" aｱｲｳｴｵ"), 'half %s' );
is( ansi_sprintf( "%7s",  r("aaｱｲｳｴｵ")),  r("aaｱｲｳｴｵ"), 'half %s' );
is( ansi_sprintf( "%7s", r("aaaｱｲｳｴｵ")), r("aaaｱｲｳｴｵ"), 'half %s' );

is( ansi_sprintf("%-7s",    r("ｱｲｳｴｵ")), r("ｱｲｳｴｵ  ") , 'half %-s' );
is( ansi_sprintf("%-7s",   r("aｱｲｳｴｵ")), r("aｱｲｳｴｵ ") , 'half %-s' );
is( ansi_sprintf("%-7s",  r("aaｱｲｳｴｵ")), r("aaｱｲｳｴｵ") , 'half %-s' );
is( ansi_sprintf("%-7s", r("aaaｱｲｳｴｵ")), r("aaaｱｲｳｴｵ"), 'half %-s' );

done_testing;
