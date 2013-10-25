requires 'perl', '5.008001';
requires 'Class::Accessor::Fast', '0.18';
requires 'List::MoreUtils', '0.10';
requires 'List::Util', '1.16';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

