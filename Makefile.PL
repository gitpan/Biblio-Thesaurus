use ExtUtils::MakeMaker;
WriteMakefile(
	      'NAME'	     => 'Biblio::Thesaurus',
	      'VERSION_FROM' => 'lib/Biblio/Thesaurus.pm',
	      'EXE_FILES'    => [qw!bin/thesaurus2any bin/thesaurus2htmls bin/thesaurusTranslate!],
	      'PREREQ_PM'    => {
				 'Test::More' => 0,
				 'Storable' => '1.0006',
				},
	     );
