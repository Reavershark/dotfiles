#!/usr/bin/env rdmd
import std.algorithm;
import std.process;
import std.stdio;
import std.string;

void main()
{
  string metadata = execute(["playerctl", "metadata"]).output;
  string status = execute(["playerctl", "status"]).output;

  string artist, song;
  foreach(line; metadata.lineSplitter)
  {
    if (line.canFind("xesam:artist"))
      artist = line.split[2 .. $].join(" ");
    else if (line.canFind("xesam:title"))
      song = line.split[2 .. $].join(" ");
  }

  status = status.strip;

  if (status == "Playing")
    writefln!"%s - %s"(artist, song);
  else if (status == "Paused")
    writefln!"(Paused) %s - %s"(artist, song);
  else
    writefln!"%s"(status);
}
