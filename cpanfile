requires 'perl', '5.014';

requires 'Text::VisualPrintf', '3.10';
requires 'Text::ANSI::Fold', '2.02';
requires 'Text::ANSI::Fold::Util';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

