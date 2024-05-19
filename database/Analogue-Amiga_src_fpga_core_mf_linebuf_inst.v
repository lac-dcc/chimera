// This program was cloned from: https://github.com/Mazamars312/Analogue-Amiga
// License: GNU General Public License v3.0

mf_linebuf	mf_linebuf_inst (
	.data ( data_sig ),
	.rdaddress ( rdaddress_sig ),
	.rdclock ( rdclock_sig ),
	.wraddress ( wraddress_sig ),
	.wrclock ( wrclock_sig ),
	.wren ( wren_sig ),
	.q ( q_sig )
	);
