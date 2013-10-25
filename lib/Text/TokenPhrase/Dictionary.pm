package Text::TokenPhrase::Dictionary;
use 5.008005;
use strict;
use warnings;

package Text::TokenPhrase;

use List::MoreUtils 'uniq';

sub dictionary_keys {
    return [qw(adjectives colors patterns nouns numbers)];
}

sub dictionary {
    return {
        adjectives => [qw(wireless furry fuzzy sleek messy incredible generous splendid superior spectacular amazing ultimate ferocious exciting lovely old-fashioned home-made grass-fed free-range grandmas grandpas governing prickly strong stellar awesome wonderful bodacious excellent stupendous groovy dancing energetic sweet sour sugarfilled glazed vegan letterman thunderous established magnetic better windy wind-up american soft genetically-modified tailored liberal conservative bluetooth)],
        colors => [qw(red yellow blue green violet taupe mauve lime golden silver grey black white tangello sunshine brown tan infrared ultraviolet pink beige almond aquamarine burnt-orange cerulean cornflower-blue denim forest-green midnight-blue peach plum sea-green ruby emerald jade rose topaz onyx pearl coral crimson cyan chocolate aqua azure lavendar chiffon khaki ivory magenta navy-blue olive salmon turquoise)],
        patterns => [qw(striped checked spotted polka-dotted plaid wavy houndstooth argyle glossy matte pinstriped tartan paisley satin honeycomb fractal waved cracked )],
        nouns => [qw(floutist carpenter jacket president address machine computer mug lamp phone wall bicycle river lake fountain building book hat pants shirt cape soup gloves pen suit photograph sand profit energy fork compact-disk floppy-disk chandelier door window laboratory people tapir wolverine wolf spider wolf-spider spider-wolf banana-slug giraffe deer-mouse capybara dingo dragon cardinal owl octopus elk moose weasel elephant rhino iguana bullfrog greyhound stickbug ladybug ant rat coyote chimpanzee housecat barracuda raven crane fox panda racoon nessie whale dolphin shark viper frog toad flounder skunk wookie dishwasher bat space-heater bobble-head lego-set pinboard flag tv video-game envelope headphones mousepad jukebox bacon eggs cereal milk sausage ham turkey nerf-gun bowl plate lazy-susan safe fireworks table chair muscles trek journey quest mission laser-gun gladiator pumpkin)],
        numbers => [1..1000000],
    };
}

sub adjectives {
    return [ uniq @{dictionary->{adjectives}}, (ref($_[0]) eq 'ARRAY' ? @{$_[0]} : ()) ];
}

sub colors {
    return [ uniq @{dictionary->{colors}}, (ref($_[0]) eq 'ARRAY' ? @{$_[0]} : ()) ];
}

sub patterns {
    return [ uniq @{dictionary->{patterns}}, (ref($_[0]) eq 'ARRAY' ? @{$_[0]} : ()) ];
}

sub nouns {
    return [ uniq @{dictionary->{nouns}}, (ref($_[0]) eq 'ARRAY' ? @{$_[0]} : ()) ];
}

sub numbers {
    return [ uniq @{dictionary->{numbers}}, (ref($_[0]) eq 'ARRAY' ? @{$_[0]} : ()) ];
}

1;
__END__



