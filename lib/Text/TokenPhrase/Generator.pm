package Text::TokenPhrase::Generator;
use 5.008005;
use strict;
use warnings;

use List::Util 'reduce';
use List::MoreUtils 'uniq';

use base 'Class::Accessor::Fast';

use Text::TokenPhrase;

__PACKAGE__->mk_accessors(qw(separator dictionary order));

sub new {
    my ($class, $separator, $options) = @_;
    my $self = $class->SUPER::new;
    $separator = '-' unless defined($separator);
    $options = {} unless defined($options);
    ($separator, $options) = ('-', $separator) if ref($separator) eq 'HASH';
    $options->{numbers} = [] if exists($options->{numbers}) && $options->{numbers} == 0;
    $self->separator($separator);
    $self->dictionary({ %{(Text::TokenPhrase->dictionary)}, %$options });
    $self->order(Text::TokenPhrase->dictionary_keys);
    return $self;
}

sub generate {
    my $self = shift;
    my $sep = $self->separator;
    my @tokens = map { @$_ ? $_->[int(rand(int(@$_)))] : () } $self->lists; # .map(&:sample)
    my $str = join($sep, @tokens); # .join(separator)
    $str =~ s/(?:\Q$sep\E)+$//g; # .chomp(separator)
    $str =~ s/-/$sep/g; # .gsub(/-/, separator)
    return $str;
}

sub permutations {
    my $self = shift;
    return reduce {
        if (!@$b) {
            $a
        } else {
            $a * int(uniq @$b);
        }
    } 1, $self->lists;
}

sub lists {
    my $self = shift;
    my $dic = $self->dictionary;
    return grep { defined($_) } map { $dic->{$_} } @{$self->order};
}

1;
__END__


