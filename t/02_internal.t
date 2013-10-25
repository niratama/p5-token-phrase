use strict;
use Test::More;

use_ok('Text::TokenPhrase::Generator');

my $generator = new_ok('Text::TokenPhrase::Generator', [{
        adjectives => [qw(adjectives)],
        colors => [qw(colors)],
        patterns => [qw(patterns)],
        nouns => [qw(nouns)],
        numbers => 0,
    }]);

is_deeply($generator->order, [qw(adjectives colors patterns nouns numbers)], 'Text::TokenPhrase::Generator#order');


is_deeply([$generator->lists], [['adjectives'],['colors'],['patterns'],['nouns'],[]], 'Text::TokenPhrae::Generator#lists');

my $phrase = $generator->generate;
is($phrase, 'adjectives-colors-patterns-nouns', 'Text::TokenPhrase::Generator#generate');

my $permutations = $generator->permutations;
is($permutations, 1, 'Text::TokenPhrase::Generator#permutations');


done_testing;


