requires 'perl', '5.014';

requires 'Text::Conceal', '1.04';
requires 'Text::ANSI::Fold', '2.28';
requires 'Text::ANSI::Fold::Util', '1.05';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Command::Runner';
    requires 'Term::ANSIColor::Concise';
};

