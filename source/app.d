import std.stdio;
import std.process;

void main(string[] args)
{

	/* auto hog = executeShell(
		escapeShellCommand("du -a " ) ~
		args[1] ~
		"|" ~
		escapeShellCommand("sort -n -r") ~
		"|" ~
		escapeShellCommand("head -n 10")); */


		auto hog = executeShell(
			"du -ah " ~ 
			args[1] ~ 
			" 2>/dev/null" ~ 
			"|" ~ 
			"grep -v 'Permission denied'" ~ 
			">&2" ~ 
			"|" ~ 
			"sort  -n -r" ~ 
			"|" ~ 
			"head -n 25"
			);

			//writeln(hog.output);
				if (hog.status != 0) 
				writeln("Failed to retrieve file listing"); 
				else
				writeln(hog.output);
				}
