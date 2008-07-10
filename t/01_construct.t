# -*- cperl -*-

use strict;
use Test::More tests => 16;

BEGIN { use_ok("Biblio::Thesaurus") }

# Thesaurus is an object of Biblio::Thesaurus type
my $the = thesaurusNew();
isa_ok($the, "Biblio::Thesaurus");

my @allterms;

# Empty thesaurus is really empty
@allterms = $the->allTerms;
is_deeply([@allterms], []);
ok(!$the->isDefined("foo"));

# Addiction really adds...
$the->addTerm("foo");
ok($the->isDefined("foo"));
ok(!$the->isDefined("bar"));

# deletion works
$the->addTerm("bar");
$the->deleteTerm("foo");
ok(!$the->isDefined("foo"));
ok($the->isDefined("bar"));

# term listing works
@allterms = $the->allTerms;
is_deeply([@allterms], [qw/bar/]);

# term listing gives all terms
$the->addTerm("foo");
@allterms = $the->allTerms;
is_deeply([sort @allterms], [qw/bar foo/]);

$the->addRelation("foo", "BT", "ugh");
@allterms = $the->allTerms;
is_deeply([sort @allterms], [qw/bar foo ugh/]);

$the->addRelation("foo", "BT", qw/zbr1 zbr2 zbr3 zbr4/);
@allterms = $the->allTerms;
is_deeply([sort @allterms], [qw/bar foo ugh zbr1 zbr2 zbr3 zbr4/]);

ok($the->hasRelation("foo", "BT", "zbr1"));
ok(!$the->hasRelation("foo", "XX", "zbr1"));
ok(!$the->hasRelation("foo", "BT", "zbr5"));
ok($the->hasRelation("foo","BT","ugh"));