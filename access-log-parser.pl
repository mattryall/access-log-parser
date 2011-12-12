#!/usr/bin/perl -w
 
use warnings;
use strict;
 
my ($pattern) = @ARGV;
die "Usage: $0 PATTERN\n(where PATTERN includes Apache log formatting elements, e.g. \"%b %h [%t] %s %r\")"
    unless defined $pattern;
 
my %conversion = (
    '%h' => '$host',
    '%l' => '$logname',
    '%u' => '$remoteuser',
    '%t' => '$date',
    '%r' => '$req',
    '%m' => '$method',
    '%U' => '$url',
    '%s' => '$status',
    '%>s' => '$status',
    '%b' => '$bytes',
    '%i{Referer}' => '$ref',
    '%i{User-Agent}' => '$ua',
    '%T' => '$time',
);
while (my ($format, $var) = each %conversion) {
  $pattern =~ s/\Q$format/$var/g
}
$pattern =~ s/\"/\\"/g;
$pattern = '"' . $pattern . '\n"';
# print STDERR "Pattern: $pattern\n";
 
while (<STDIN>) {
    my @tokens;
     
    # parse Apache combined access log format
    push @tokens, $1 while (/
        (                # first captured group matches:
            ".*?(?<!\\)" # - a quoted expression, or
            | \[.+?\]    # - a bracketed expression, or
            | \S+        # - some non-space characters.
        )
        (?:              # followed by:
            \s+          # - some whitespace, or
            | $          # - the end of a line.
        )/xg);
    my ($host, $logname, $remoteuser, $date, $req, $status, $bytes, $ref, $ua, $time)  = @tokens;
#     for ($date) {
#         s/^\[//; # strip leading bracket
#         s/\]$//; # strip trailing bracket
#     }
    for ($req, $ua) {
        s/^"//; # strip leading quote
        s/"$//; # strip trailing quote
        s/\\"/"/g; # fix escaped quotes
    }
    my ($method, $url) = ("-", "-");
    if ($req =~ m!^(GET|POST|HEAD|OPTIONS|PROPFIND) (.*) HTTP/1.[01]$!) {
        $method = $1;
        $url = $2;
    }
 
    print eval($pattern);
}
