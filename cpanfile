requires 'perl', '5.014';

requires 'Text::VisualPrintf', '3.03';
requires 'Text::ANSI::Fold::Util', '0.01';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Getopt::EX';
};

