#!/usr/bin/perl

# PS1='$(perl ~/.custom/prompt.pl --user=\u --host=\h --dir=`pwd` --time=\t)'

use strict;
use warnings;

use Term::ANSIColor qw/:constants/;
use Getopt::Long;

my ($short, $user, $host, $time, $dir);
GetOptions(
    'short'  => \$short,
    'user=s' => \$user,
    'host=s' => \$host,
    'time=s' => \$time,
    'dir=s'  => \$dir,
);

# change home directory to ~
$dir =~ s!^/home/$user\b!~!;

# Get current branch
my ($branch, $changes) = parse_git();
my $branch_color = $changes ? RED : GREEN;
##################################################

if ( $short ) {
    if ($branch) {
        $branch =~ s/^(.).+(.)$/$1$2/;
        $branch = join('', $branch_color, "$branch", CLEAR, '|');
    }

    $user =~ s/^(\w{2})\w+$/$1/;
    $host =~ s/^(\w{3})\w*$/$1/;
    $time =~ s/^(\d+:\d+):\d+$/$1/;
    print "$time|$branch$user\@$host:$dir\$ ";
}
else {
    if ($branch) {
        $branch = join('', $branch_color, "{$branch} ", CLEAR)
    }
    print "$time $branch$user\@$host:$dir\$ ";
}

##################################################

sub parse_git {
    my $str = `git status 2>&1`;
    if ($str =~ /^fatal:/) {
        return '';
    }
    else {
        # Show if there are changes
        my $changes = 0;
        if ($str =~ /Changes not staged for commit:/) { $changes = 1};
        if ($str =~ /Untracked files:/) { $changes = 1};

        # Get branch name
        $str =~ /^\# On branch (\S+)/igs;
        return ($1 || '', $changes);
    }
}
