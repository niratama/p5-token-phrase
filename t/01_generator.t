use strict;
use Test::More;

use_ok $_ for qw(
    Text::TokenPhrase
);

subtest 'test_that_numbers_can_be_excluded' => sub {
    my $phrase = Text::TokenPhrase->generate(numbers => 0);
    unlike($phrase, /\d+/);
};

subtest 'test_that_permutations_calculate_all_combinations' => sub {
    my $permutations = Text::TokenPhrase->permutations(
        adjectives => [qw(test)],
        colors => [qw(test)],
        patterns => [qw(test)],
        nouns => [qw(test)],
        numbers => 0,
    );
    is($permutations, 1);
};

subtest 'test_that_separator_can_be_overridden' => sub {
    my $phrase = Text::TokenPhrase->generate("+");
    like($phrase, qr/\+/);
    unlike($phrase, qr/-/);
};



subtest 'test_that_adjectives_can_be_overridden' => sub {
    my $phrase = Text::TokenPhrase->generate(adjectives => [qw(test)]);
    like($phrase, qr/test/);
};

subtest 'test_that_colors_can_be_overridden' => sub {
    my $phrase = Text::TokenPhrase->generate(colors => [qw(test)]);
    like($phrase, qr/test/);
};

subtest 'test_that_patterns_can_be_overridden' => sub {
    my $phrase = Text::TokenPhrase->generate(patterns => [qw(test)]);
    like($phrase, qr/test/);
};

subtest 'test_that_nouns_can_be_overridden' => sub {
    my $phrase = Text::TokenPhrase->generate(nouns => [qw(test)]);
    like($phrase, qr/test/);
};

subtest 'test_that_dictionaries_can_be_added_to' => sub {
    my $adjectives = Text::TokenPhrase->adjectives([qw(test)]);
    my $colors = Text::TokenPhrase->colors([qw(test)]);
    my $patterns = Text::TokenPhrase->patterns([qw(test)]);
    my $nouns =>Text::TokenPhrase->nouns([qw(test)]);
    is(scalar(@{Text::TokenPhrase->adjectives}), scalar(@$adjectives));
    is(scalar(@{Text::TokenPhrase->colors}), scalar(@$colors));
    is(scalar(@{Text::TokenPhrase->patterns}), scalar(@$patterns));
    is(scalar(@{Text::TokenPhrase->nouns}), scalar(@$nouns));
};

done_testing;

