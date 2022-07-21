#!/usr/bin/perl -w

# Given a string that has a valid email address, hide the first part
# of the email (before the @ sign), minus the first and last
# character. Optional second argument to hideEmail will also hide the
# first part of the domain name.

# Usage: Pass this script a single argument, or populate the $email
# variable below

use strict;
use constant HIDEFULL => 1;

my $email = $ARGV[0] || 'example_123+test@example.co.uk';

hideEmail($email, HIDEFULL);

sub hideEmail {
    my ($pre_char1, $mid_pre_at, $pre_char2)         = ($_[0] =~ /^(\w)(.+)(\w\@)/);
    my ($post_char1, $mid_post_at, $mid_post_domain) = ($_[0] =~ /\@(\w)(.+?)(\..+)$/);
    $mid_pre_at  =~ s/./\*/g;
    $mid_post_at =~ s/./\*/g if $_[1];
    print "$pre_char1$mid_pre_at$pre_char2$post_char1$mid_post_at$mid_post_domain\n";
}
