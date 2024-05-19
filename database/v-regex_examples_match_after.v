// This program was cloned from: https://github.com/shellbear/v-regex
// License: MIT License

/*
	* V bindings for lpcre library
	* http://www.pcre.org/
	* examples/match_after.v
	* https://github.com/shellbear/v-regex
*/

import regex

fn main() {
	r := regex.new_regex('Match everything after this: (.+)', 0) or {
		println('An error occured!')
		return
	}

	m := r.match_str('Match everything after this: "I <3 VLang!"', 0, 0) or {
		println('No match!')
		return
	}

	// m.get(0) -> Match everything after this: "I <3 VLang!"
	// m.get(1) -> "I <3 VLang!"
	// m.get(2) -> Error!
	whole_match := m.get(0) or {
		println('We matched nothing...')
		return
	}

	matched_str := m.get(1) or {
		println('We matched nothing...')
		return
	}

	println(whole_match) // Match everything after this: "I <3 VLang!"
	println(matched_str) // "I <3 VLang!"'

	r.free()
}
