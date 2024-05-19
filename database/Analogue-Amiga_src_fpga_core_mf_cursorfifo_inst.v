// This program was cloned from: https://github.com/Mazamars312/Analogue-Amiga
// License: GNU General Public License v3.0

mf_cursorfifo	mf_cursorfifo_inst (
	.data ( data_sig ),
	.rdclk ( rdclk_sig ),
	.rdreq ( rdreq_sig ),
	.wrclk ( wrclk_sig ),
	.wrreq ( wrreq_sig ),
	.q ( q_sig ),
	.rdusedw ( rdusedw_sig )
	);
