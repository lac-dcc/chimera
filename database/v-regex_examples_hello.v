// This program was cloned from: https://github.com/shellbear/v-regex
// License: MIT License

/*
	* V bindings for lpcre library
	* http://www.pcre.org/
	* examples/hello.v
	* https://github.com/shellbear/v-regex
*/

import regex

fn main() {
	r := regex.new_regex('Hello', 0) or {
		println('An error occured!')
		return
	}

	m := r.match_str('Hello world!', 0, 0) or {
		println('No match!')
		return
	}

	// m.get(0) -> Hello
	// m.get(1) -> Error!
	matched_str := m.get(0) or {
		println('We matched nothing...')
		return
	}

	println(matched_str) // Hello

	r.free()
}
