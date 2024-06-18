// This program was cloned from: https://github.com/briansune/USB-PD-3.1-Verilog
// License: MIT License

//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 


`timescale 1ns/1ps

module cc_line#(
	parameter system_khz = 200000
)(
	
	input				nrst,
	input				clock,
	
	output				cc_din,
	input				cc_dout,
	
	input				cc_check,
	input				cc_io_ctrl,
	output				cc_lock,
	
	// Phy IOs
	input				phy_in_cc1,
	// input				phy_in_cc1_p,
	// input				phy_in_cc1_n,
	input				phy_in_cc2,
	// input				phy_in_cc2_p,
	// input				phy_in_cc2_n,
	
	output				phy_discon,
	
	output				phy_out_en,
	output				phy_out_cc1,
	output				phy_out_cc2,
	
	output				phy_debug_cc1,
	output				phy_debug_cc2
);
	
	localparam [23 : 0]	ten_ms = (system_khz / 100) - 1;
	
	reg					phy_discon_r;
	
	reg		[1 : 0]		cc_msel;
	// reg		[23 : 0]	periodic_cnt;
	// reg					inter_chk;
	
	// output masking based on lock
	assign phy_out_cc1 = cc_msel[0] & cc_dout & cc_io_ctrl;
	assign phy_out_cc2 = cc_msel[1] & cc_dout & cc_io_ctrl;
	assign phy_out_en = !cc_io_ctrl;
	
	// always@(posedge clock)begin
		// if(!nrst)begin
			// periodic_cnt <= 24'd0;
			// inter_chk <= 1'b0;
		// end else begin
			// if(cc_io_ctrl | cc_check | periodic_cnt >= ten_ms)
				// periodic_cnt <= 24'd0;
			// else
				// periodic_cnt <= periodic_cnt + 23'd1;
			
			// if(!cc_io_ctrl & periodic_cnt >= ten_ms)
				// inter_chk <= 1'b1;
			// else
				// inter_chk <= 1'b0;
		// end
	// end
	
	wire	cc1;
	wire	cc2;
	
	assign phy_debug_cc1 = cc1;
	assign phy_debug_cc2 = cc2;
	
	assign phy_discon = phy_discon_r;
	
	assign cc_din =  (cc_io_ctrl) ? 1'b1 : (cc1 | cc2);
	
	assign cc1 = phy_in_cc1;
	assign cc2 = phy_in_cc2;
	
	// IBUFDS#(
		// .DIFF_TERM		("FALSE"),
		// .IBUF_LOW_PWR	("FALSE"),
		// .IOSTANDARD		("LVDS_25")
	// )IBUFDS_cc1_inst(
		// .O		(cc1),
		// .I		(phy_in_cc1_p),
		// .IB		(phy_in_cc1_n)
	// );
	
	// IBUFDS#(
		// .DIFF_TERM		("FALSE"),
		// .IBUF_LOW_PWR	("FALSE"),
		// .IOSTANDARD		("LVDS_25")
	// )IBUFDS_cc2_inst(
		// .O		(cc2),
		// .I		(phy_in_cc2_p),
		// .IB		(phy_in_cc2_n)
	// );
	
	always@(posedge clock)begin
		phy_discon_r <= cc1 ^ cc2;
	end
	
	always@(posedge clock)begin
		if(!nrst)begin
			cc_msel <= 2'b00;
		end else if(!cc_io_ctrl & cc_check)begin
			cc_msel <= {cc2, cc1} & {2{cc2 ^ cc1}};
		end
	end
	
	reg		cc_lock_r;
	
	
	assign cc_lock = cc_lock_r;
	
	always@(posedge clock)begin
		if(!nrst)begin
			cc_lock_r <= 1'b0;
		end else begin
			cc_lock_r <= cc2 ^ cc1;
		end
	end
	
endmodule
