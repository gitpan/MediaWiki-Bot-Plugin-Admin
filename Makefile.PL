
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A plugin to MediaWiki::Bot providing admin functions',
  'AUTHOR' => 'Dan Collins <en.wp.2t47@gmail.com>, Mike.lifeguard <mike.lifeguard@gmail.com>, patch and bug report contributors',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'MediaWiki::Bot' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'MediaWiki-Bot-Plugin-Admin',
  'EXE_FILES' => [],
  'LICENSE' => 'gpl',
  'NAME' => 'MediaWiki::Bot::Plugin::Admin',
  'PREREQ_PM' => {
    'Carp' => '0',
    'Exporter' => '0'
  },
  'VERSION' => '3.2.0',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



