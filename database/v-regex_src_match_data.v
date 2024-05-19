// This program was cloned from: https://github.com/shellbear/v-regex
// License: MIT License

/*
	* V bindings for lpcre library
	* http://www.pcre.org/
	* match_data.v
	* https://github.com/shellbear/v-regex
*/

module regex

struct MatchData {
pub:
	// A pointer to pcre structure
	re *C.pcre

	ovector []int
	str string
	pos int
	group_size int
}

// Check if group index is valid
pub fn (m MatchData) valid_group(index int) bool {
	return -m.group_size <= index && index < m.group_size
}

/* Returns a matched group based on index
	* (.+) hello (.+) -> 'This is a simple hello world'
	* get(0) -> This is a simple hello world
	* get(1) -> This is a simple
	* get(2) -> world
	* get(3) -> Error!
*/
pub fn (m MatchData) get(index int) ?string {

	if !m.valid_group(index) {
		return error('Index out of bounds')
	}

	if (index < 0) {
		index += m.group_size
	}

	start := m.ovector[index * 2]
	end := m.ovector[index * 2 + 1]

	if start < 0 || end > m.str.len {
		return error('Match group is invalid')
	}

	substr := m.str.substr(start, end)
	return substr
}

/* Returns all matched groups
*/
pub fn (m MatchData) get_all() []string {
	mut res := []string

	for i := 1;; i++ {
		substr := m.get(i) or {
			break
		}
		res << substr
	}

	return res
}
