#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use Encode::Locale;
use Encode;
use Capture::Tiny ':all';

my @flac = `find . -name '*.flac'`;
my @mp3  = `find . -name '*.mp3'`;

my %rem;
for my $f ( @flac, @mp3 ) {
  chomp( $f );
  print "\r$f";

  my ( $artist, $title ) =
      $f =~ /\.flac$/ ? read_flac_info( $f )
    : $f =~ /\.mp3$/  ? read_mp3_info( $f )
    :                   ( undef, undef );

  next unless ( $artist and $title );

  if ( exists $rem{$artist}{$title} ) {
    print "\n=======>>> $artist, $title\n";
    print "exists $rem{$artist}{$title}\n";
    print "remove $f\n";
    unlink( $f );
  } else {
    $rem{$artist}{$title} = $f;
  }
} ## end for my $f ( @flac, @mp3)

sub read_mp3_info {
  my ( $f ) = @_;

  my ( $artist, $stderr, $exit ) = capture {
    system( qq[mp3info -p %a "$f"] );
  };

  my ( $title, $stderr_t, $exit_t ) = capture {
    system( qq[mp3info -p %t "$f"] );
  };

  return unless ( $artist and $title );
  return ( $artist, $title );
}

sub read_flac_info {
  my ( $f ) = @_;
  my $cmd = qq[metaflac --export-tags-to=- "$f"];

  my ( $tags, $stderr, $exit ) = capture {
    system( $cmd);
  };

  my ( $artist ) = $tags =~ m#artist=(.+?)\n#si;
  if ( !$artist ) {
    ( $artist ) = $tags =~ m#performer=(.+?)\n#si;
  }
  my ( $title ) = $tags =~ m#title=(.+?)\n#si;

  return unless ( $artist and $title );
  return ( $artist, $title );
}
