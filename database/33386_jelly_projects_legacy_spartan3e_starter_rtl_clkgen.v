// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//
//                                 Copyright (C) 2008-2009 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps


// clock generator
module clkgen
		(
			input	wire		in_reset,
			input	wire		in_clk,
			
			output	wire		out_clk,
			output	wire		out_clk_x2,
			output	wire		out_clk_x2_90,
			output	wire		out_clk_uart,
			output	wire		out_reset,
			
			output	wire		locked
		);
	
	
	// -------------------------
	//  Input Clock
	// -------------------------
	
	// clk_in
	wire		in_clk_bufg;
	IBUFG
		i_ibufg_clkin
			(
				.I		(in_clk), 
				.O		(in_clk_bufg)
			);
	
	
	// -------------------------
	//  DCM 0
	// -------------------------
	
	// clk0
	wire		dcm0_clk_0;
	wire		dcm0_clk_0_bufg;
	BUFG
		i_bufg_dcm0_clk_0
			(
				.I		(dcm0_clk_0), 
				.O		(dcm0_clk_0_bufg)
			);
	
	// clk_2x
	wire		dcm0_clk_2x;
	wire		dcm0_clk_2x_bufg;
	BUFG
		i_bufg_sys_clk_2x
			(
				.I		(dcm0_clk_2x), 
				.O		(dcm0_clk_2x_bufg)
			);
	
	// DCM
	wire		dcm0_locked;
	DCM
			#(
				.CLK_FEEDBACK			("1X"),
				.CLKDV_DIVIDE			(2.0),
				.CLKFX_DIVIDE			(1),
				.CLKFX_MULTIPLY			(2),
				.CLKIN_DIVIDE_BY_2		("FALSE"),
				.CLKIN_PERIOD			(20.000),
				.CLKOUT_PHASE_SHIFT		("NONE"),
				.DESKEW_ADJUST			("SYSTEM_SYNCHRONOUS"),
				.DFS_FREQUENCY_MODE		("LOW"),
				.DLL_FREQUENCY_MODE		("LOW"),
				.DUTY_CYCLE_CORRECTION	("TRUE"),
				.FACTORY_JF				(16'h8080),
				.PHASE_SHIFT			(0),
				.STARTUP_WAIT			("FALSE")
			)
		i_dcm_0
			(
				.CLKFB					(dcm0_clk_0_bufg), 
				.CLKIN					(in_clk_bufg), 
				.DSSEN					(1'b0),
				.PSCLK					(1'b0), 
				.PSEN					(1'b0), 
				.PSINCDEC				(1'b0), 
				.RST					(in_reset),
				.CLKDV					(),
				.CLKFX					(), 
				.CLKFX180				(), 
				.CLK0					(dcm0_clk_0), 
				.CLK2X					(dcm0_clk_2x), 
				.CLK2X180				(), 
				.CLK90					(), 
				.CLK180					(), 
				.CLK270					(), 
				.LOCKED					(dcm0_locked), 
				.PSDONE					(), 
				.STATUS					()
			);
	
	
	// -------------------------
	//  DCM 1
	// -------------------------

	// clk_0
	wire		dcm1_clk_0;
	wire		dcm1_clk_0_bufg;
	BUFG
		i_bufg_dcm1_clk_0
			(
				.I		(dcm1_clk_0), 
				.O		(dcm1_clk_0_bufg)
			);

	// clk_dv
	wire		dcm1_clk_dv;
	wire		dcm1_clk_dv_bufg;
	BUFG
		i_bufg_dcm1_clk_dv
			(
				.I		(dcm1_clk_dv), 
				.O		(dcm1_clk_dv_bufg)
			);
	
	// clk_90
	wire		dcm1_clk_90;
	wire		dcm1_clk_90_bufg;
	BUFG
		i_bufg_dcm1_clk_90
			(
				.I		(dcm1_clk_90), 
				.O		(dcm1_clk_90_bufg)
			);
	
	// DCM
	wire		dcm1_locked;
	DCM
			#(
				.CLK_FEEDBACK			("1X"),
				.CLKDV_DIVIDE			(2.0),
				.CLKFX_DIVIDE			(1),
				.CLKFX_MULTIPLY			(4),
				.CLKIN_DIVIDE_BY_2		("FALSE"),
				.CLKIN_PERIOD			(10.000),
				.CLKOUT_PHASE_SHIFT		("NONE"),
				.DESKEW_ADJUST			("SYSTEM_SYNCHRONOUS"),
				.DFS_FREQUENCY_MODE		("LOW"),
				.DLL_FREQUENCY_MODE		("LOW"),
				.DUTY_CYCLE_CORRECTION	("TRUE"),
				.FACTORY_JF				(16'h8080),
				.PHASE_SHIFT			(0),
				.STARTUP_WAIT			("FALSE")
			)
		i_dcm_sdram
			(
				.CLKFB					(dcm1_clk_0_bufg), 
				.CLKIN					(dcm0_clk_2x_bufg), 
				.DSSEN					(1'b0),
				.PSCLK					(1'b0), 
				.PSEN					(1'b0), 
				.PSINCDEC				(1'b0), 
				.RST					(in_reset | !dcm0_locked),
				.CLKDV					(dcm1_clk_dv),
				.CLKFX					(), 
				.CLKFX180				(), 
				.CLK0					(dcm1_clk_0), 
				.CLK2X					(), 
				.CLK2X180				(), 
				.CLK90					(dcm1_clk_90), 
				.CLK180					(), 
				.CLK270					(), 
				.LOCKED					(dcm1_locked), 
				.PSDONE					(), 
				.STATUS					()
			);
	
	
	// -------------------------
	//  synchronous reset
	// -------------------------
	
	reg		[1:0]	reg_reset;
	always @( posedge out_clk or posedge in_reset ) begin
		if ( in_reset ) begin
			reg_reset <= 2'b11;
		end
		else begin
			if ( !locked ) begin
				reg_reset <= 2'b11;
			end
			else begin
				reg_reset <= {1'b0, reg_reset[1]};
			end
		end
	end
	
	
	// -------------------------
	//  uart clock divider
	// -------------------------
	
	reg							uart_clk_dv;
	reg		[7:0]				dv_counter;
	always @ ( posedge out_clk_x2 ) begin
		if ( out_reset ) begin
			dv_counter  <= 0;
			uart_clk_dv <= 1'b0;
		end
		else begin
			if ( dv_counter == (54 - 1) ) begin		// 115200 bps
				dv_counter  <= 0;
				uart_clk_dv <= ~uart_clk_dv;
			end
			else begin
				dv_counter  <= dv_counter + 1;
			end
		end
	end
	
	
	// -------------------------
	//  assign
	// -------------------------
	
	assign out_clk       = dcm1_clk_dv_bufg;
	assign out_clk_x2    = dcm1_clk_0_bufg;
	assign out_clk_x2_90 = dcm1_clk_90_bufg;
	assign out_clk_uart  = uart_clk_dv;
	assign out_reset     = reg_reset[0];
	
	assign locked        = dcm0_locked & dcm1_locked;
	
	
endmodule

