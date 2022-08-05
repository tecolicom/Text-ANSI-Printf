requires 'perl', '5.014';

requires 'Text::Conceal', '0.99';
requires 'Text::ANSI::Fold::Util', '0.06';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

