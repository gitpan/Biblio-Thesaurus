use ExtUtils::MakeMaker;
WriteMakefile(
	      'NAME'	     => 'Biblio::Thesaurus',
	      'VERSION_FROM' => 'Thesaurus.pm',
	      'PREREQ_PM'    => {
				 'Test::More' => 0,
				 'Storable' => '1.0006',
				},
	     );
