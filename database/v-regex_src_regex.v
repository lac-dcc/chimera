// This program was cloned from: https://github.com/shellbear/v-regex
// License: MIT License

/*
	* V bindings for lpcre library
	* http://www.pcre.org/
	* regex.v
	* https://github.com/shellbear/v-regex
*/

module regex

struct Regex {
pub:
	// A pointer to pcre structure
	re *C.pcre

	// A pointer to pcre_extra structure
	extra *C.pcre_extra

	// The number of capture groups
	captures int
}

pub fn (r Regex) free() {
	if !isnil(r.re) {
		C.pcre_free(r.re)
	}
	if !isnil(r.extra) {
		C.pcre_free_study(r.extra)
	}
}

/* Returns a MatchData structure containing matched strings and informations
	* str: the string to test
	* pos: the position of the beginning of the string (default: 0)
	* options: the options as mentioned in the PCRE documentation
*/
pub fn (r Regex) match_str(str string, pos, options int) ?MatchData {
	if pos < 0 || pos >= str.len {
		return error('Invalid position')
	}

	ovector_size := (r.captures + 1) * 3
	ovector := [0; ovector_size]

	ret := C.pcre_exec(r.re, r.extra, str.str, str.len, pos, options, ovector.data, ovector_size)

	if ret <= 0 {
		return error('No match!')
	}

	return MatchData{
		re: r.re
		str: str
		ovector: ovector
		pos: pos
		group_size: r.captures + 1
	}
}

/* Create a new regex
	* source: the string representing the regex
	* options: the options as mentioned in the PCRE documentation
*/
pub fn new_regex(source string, options int) ?Regex {
	err := string{}
	studyerr := string{}
	erroffset := 0
	captures := 0

	re := C.pcre_compile(source.str, options, &err, &erroffset, 0)

	if isnil(re) {
		return error('Failed to compile regex')
	}

	extra := C.pcre_study(re, 0, &studyerr)

	if studyerr.len != 0 {
		return error('Failed to study regex	')
	}

	C.pcre_fullinfo(re, 0, PCRE_INFO_CAPTURECOUNT, &captures)

	return Regex{re, extra, captures}
}
