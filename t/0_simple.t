# -*- cperl -*-
use Data::Dumper;
use strict;
use Test;

BEGIN { plan tests => 11 }

# Check module loadability
use Biblio::Thesaurus;
my $loaded = 1;
ok(1);

# Check 'transitive closure' method
my $thesaurus = thesaurusLoad('examples/thesaurus.portuguese');
my @ft= $thesaurus->tc("local","NT");
my $count = scalar(@ft);
ok(10,$count);

# Check depth_first
my $ft= $thesaurus->depth_first("local" , 2 ,"NT","INST");
my $k=keys(%$ft);
ok($k,10-1);

# Check miscelaneous
ok(defined($thesaurus->{baselang}));
ok(defined($thesaurus->{languages}{$thesaurus->{baselang}}));

# Check multi-lang support
$thesaurus = thesaurusLoad("examples/animal.the");
ok($thesaurus->{EN}{cat},"gato");

ok($thesaurus->getdefinition("cat"),"gato");

# Check definition type comparison
ok($thesaurus->isDefined('GaTo'));


$thesaurus = thesaurusLoad('examples/thesaurus.portuguese');
# tests number 8 and 9
my @defineds = keys %{$thesaurus->{$thesaurus->{baselang}}};
my $true = 1;
my $true2 = 1;
my $term;

while($term = shift @defineds) {
  $true = 0 unless $thesaurus->isDefined($term);
  $true2 = 0 unless $thesaurus->isDefined($thesaurus->_definition($term));
}
ok($true);
ok($true2);

# Test dups on dup.the
$thesaurus = thesaurusLoad('t/dup.the');
my @terms = $thesaurus->terms("a", "NT");
ok(! array_with_dups(\@terms));

sub array_with_dups {
  my ($a1) = @_;
  my (%h1);
  @h1{@$a1}=@$a1;

  for (@$a1) {
    if (exists $h1{$_}) {
      delete $h1{$_};
    } else {
      return 1; 		# DUP
    }
  }
  return 0
}
