# -*- cperl -*-
use Data::Dumper;
use strict;
use Test;

BEGIN { plan tests => 1 }

# Check module loadability
use Biblio::Thesaurus;
my $loaded = 1;
ok(1);

my $a = thesaurusLoad("t/a.the");

my $c = $a->append("t/b.the");

# print STDERR Dumper($c);
