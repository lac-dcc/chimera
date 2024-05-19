// This program was cloned from: https://github.com/shellbear/v-regex
// License: MIT License

/*
	* V bindings for lpcre library
	* http://www.pcre.org/
	* examples/match_all.v
	* https://github.com/shellbear/v-regex
*/

import regex

fn main() {
	r := regex.new_regex('(.*)(hello)+', 0) or {
		println('An error occured!')
		return
	}

	tests := [
		'This should match... hello',
		'This could match... hello!',
		'More than one hello.. hello',
		'No chance of a match...'
	]

	for test in tests {
		println('\nTesting string: $test')
		m := r.match_str(test, 0, 0) or {
			println('No match!')
			continue
		}

		println(m.get_all())
	}

	r.free()
}
