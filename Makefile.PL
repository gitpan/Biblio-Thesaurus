use ExtUtils::MakeMaker;
WriteMakefile(
	      'NAME'	     => 'Biblio::Thesaurus',
	      'VERSION_FROM' => 'Thesaurus.pm',
	      'PREREQ_PM'    => {
				 'Storable' => '1.0006',
				},
	     );
