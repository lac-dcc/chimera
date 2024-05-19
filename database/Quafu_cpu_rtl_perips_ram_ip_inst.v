// This program was cloned from: https://github.com/gzzyyxh/Quafu
// License: MIT License

ram_ip	ram_ip_inst (
	.data ( data_sig ),
	.rdaddress ( rdaddress_sig ),
	.rdclock ( rdclock_sig ),
	.rden ( rden_sig ),
	.wraddress ( wraddress_sig ),
	.wrclock ( wrclock_sig ),
	.wren ( wren_sig ),
	.q ( q_sig )
	);
