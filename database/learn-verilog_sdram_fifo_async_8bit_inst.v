// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

fifo_async_8bit	fifo_async_8bit_inst (
	.data ( data_sig ),
	.rdclk ( rdclk_sig ),
	.rdreq ( rdreq_sig ),
	.wrclk ( wrclk_sig ),
	.wrreq ( wrreq_sig ),
	.q ( q_sig ),
	.rdempty ( rdempty_sig ),
	.wrfull ( wrfull_sig )
	);
