#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 13;
use Test::Exception;

BEGIN {
    use_ok('IOC::Config');
    use_ok('t::SubClass');    
    use_ok('t::Classes');
}

my $CLASS = 't::SubClass';

my $object = $CLASS->new;
lives_ok {
    $object->read('t/confs/70_IOC_Config_subclass.conf')
} '... File read correctly';

my $r = IOC::Registry->new;
isa_ok( $r, 'IOC::Registry' );

my $s1 = $r->locateService( '/Cont1/Serv1' );
isa_ok( $s1, 'Foo' );
is( $s1->getVal, undef, '... got the value expected' );

my $s2 = $r->locateService( '/Cont1/Serv2' );
isa_ok( $s2, 'Foo' );
is( $s2->getVal, undef, '... got the value expected' );

my $s3 = $r->locateService( '/Cont1/Serv3' );
isa_ok( $s3, 'Foo' );
is( $s3->getVal, 2, '... got the value expected' );

my $s4 = $r->locateService( '/Cont1/Serv4' );
isa_ok( $s4, 'Foo' );
is( $s4->getVal, 2, '... got the value expected' );