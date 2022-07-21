#!/usr/bin/perl -w

use strict;
use constant HIDEFULL => 1;

hideEmail('example_123+test@example.co.uk', HIDEFULL);

sub hideEmail {
    my ($pre_char1, $mid_pre_at, $pre_char2)         = ($_[0] =~ /^(\w)(.+)(\w\@)/);
    my ($post_char1, $mid_post_at, $mid_post_domain) = ($_[0] =~ /\@(\w)(.+?)(\..+)$/);
    $mid_pre_at  =~ s/./\*/g;
    $mid_post_at =~ s/./\*/g if $_[1];
    print $pre_char1 . $mid_pre_at . $pre_char2 . $post_char1 . $mid_post_at . $mid_post_domain . "\n";
}
