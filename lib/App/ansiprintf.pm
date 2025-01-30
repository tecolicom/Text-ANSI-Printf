package App::ansiprintf;

use v5.14;
use warnings;
use open IO => ':utf8', ':std';

our $VERSION = "2.0602";

our $WARN //= $ENV{ANSIPRINTF_WARNING} // 1;
$SIG{__WARN__} = sub {
    my $warning = shift;
    if ($warning =~ /^(.*) in sprintf at /) {
	print STDERR "$1\n" if $WARN;
    } else {
	print STDERR $warning;
    }
};

use Pod::Usage;
use Text::ANSI::Printf qw(ansi_printf);
$Text::ANSI::Printf::REORDER = 1;

use App::ansiprintf::Util qw(decode_argv unescape);

sub new {
    return __PACKAGE__;
}

sub run {
    my $app = shift;
    local @ARGV = decode_argv splice @_ or pod2usage;
    ansi_printf map unescape, @ARGV;
    return 0;
}

1;

__END__

=encoding utf-8

=head1 NAME

ansiprintf - Colored printf command using ANSI terminal sequence

=head1 SYNOPSIS

ansiprintf format args ...

=head1 DESCRIPTION

Document is included in the executable script.

=head1 AUTHOR

Kazumasa Utashiro

=head1 LICENSE

Copyright © 2023- Kazumasa Utashiro.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
