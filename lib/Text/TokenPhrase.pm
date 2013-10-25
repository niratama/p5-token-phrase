package Text::TokenPhrase;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use Text::TokenPhrase::Dictionary;
use Text::TokenPhrase::Generator;

sub generate {
    my $this = shift;
    Text::TokenPhrase::Generator->new(@_)->generate;
}

sub permutations {
    my $this = shift;
    Text::TokenPhrase::Generator->new(@_)->permutations;
}

1;
__END__

=encoding utf-8

=head1 NAME

Text::TokenPhrase - Simple module that generates unique phrases

=head1 SYNOPSIS

    use Text::TokenPhrase;

=head1 DESCRIPTION

Text::TokenPhrase is Perl port of L<TokenPhrase|https://github.com/genericsteele/token_phrase>.

=head1 LICENSE

Copyright (C) Kenichi Kobayashi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Kenichi Kobayashi E<lt>niratama3@gmail.comE<gt>

=head1 SEE ALSO

L<TokenPhrase|https://github.com/genericsteele/token_phrase>

=cut

