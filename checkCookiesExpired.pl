#!/usr/bin/perl

use LWP::UserAgent;
use http::Cookies;
use HTTP::Request::Common;

#save cookie to a file
$cookies = HTTP::Cookies->new(file => "/tmp/cookie.txt", autosave => 1,);

#set http head
$URL = "http://www.xxxxx.com/xxx/login.php"
$UAGENT = LWP::UserAgent->new();
$UAGENT->cookie_jar( $cookies );



sub addDays {
	my ($version, $key, $val, $path, $doamin, $port, $path_spec, $secure, $expires, $discard, $rest) = @_;

	if( ($doamin eq $find::doamin ) and ( $path eq $find::path ) and ($key eq $find::key))
	{
		$expires = $expires + (3600 * 24);
		$cookies->clear( $doamin, $path, $key);
		$cookies->set_cookie( $version, $key, $val, $path, $doamin, $port, $path_spec, $secure, $expires, $discard, $rest);
		$find::changed++;
	}
}

sub printCookie {
	my ($version, $key, $val, $path, $doamin, $port, $path_spec, $secure, $expires, $discard, $rest) = @_;

	if( ($doamin eq $find::doamin) and ($path eq $find::path) and ($key eq $find::key))
	{
		print "$doamn, $path, $key , $val, $expires\n"
	}
}

$req = HTTP:Request->new( GET => $URL);
$resp = $UAGENT->request($req);

$find::doamin = "xxxxx.com";
$find::path = "/";
$find::key = "session_id";

$cookies->scan( \&printCookie );
$cookies->scan( \&addDays );
$cookies->scan( \&printCookie );
