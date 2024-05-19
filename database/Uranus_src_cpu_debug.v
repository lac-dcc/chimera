// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`define DEBUG_EN

`ifdef DEBUG_EN
    `define DEBUG (* mark_debug = "true" *)
`else
    `define DEBUG
`endif
