package Foo;

sub new {
    my $class = shift;
    bless [ @_ ], $class
}

sub getVal { $_[0][0] }

package Bar;

sub new { bless {}, shift }

sub setVal { $_[0]->{value} = $_[1] }
sub getVal { $_[0]->{value} }

1;
__END__