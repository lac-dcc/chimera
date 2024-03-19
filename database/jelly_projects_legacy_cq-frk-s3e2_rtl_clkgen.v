// ---------------------------------------------------------------------------
//  Jelly -- The computing system for Spartan-3e Starter Kit
//
//                                      Copyright (C) 2008 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps


// Clock generator
module clkgen
		(
			input	wire	in_reset, 
			input	wire	in_clk, 
			
			output	wire	out_clk,
			output	wire	out_clk_x2,
			output	wire	out_clk_uart,
			output	wire	out_reset,
			
			output	wire	locked
		);

	
	// -------------------------
	//  Input Clock
	// -------------------------
	
	// clk_in
	wire		in_clk_ibufg;
	IBUFG
		i_ibufg_clkin
			(
				.I		(in_clk), 
				.O		(in_clk_ibufg)
			);
	
	
	
	// -------------------------
	//  System Clock
	// -------------------------
	
	// clk0
	wire		clk0;
	wire		clk0_bufg;
	BUFG
		i_bufg_clk0
			(
				.I		(clk0), 
				.O		(clk0_bufg)
			);
	
	// clkdv
	wire		clkdv;
	wire		clkdv_bufg;
	BUFG
		i_bufg_clkdv
			(
				.I		(clkdv), 
				.O		(clkdv_bufg)
			);

	// clk2x
	wire		clk2x;
	wire		clk2x_bufg;
	BUFG
		i_bufg_clk2x
			(
				.I		(clk2x), 
				.O		(clk2x_bufg)
			);
	
	// DCM
	wire		dcm_locked;
	DCM
			#(
				.CLK_FEEDBACK			("1X"),
				.CLKDV_DIVIDE			(2.0),
				.CLKFX_DIVIDE			(1),
				.CLKFX_MULTIPLY			(4),
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
		i_dcm
			(
				.CLKFB					(clk0_bufg), 
				.CLKIN					(in_clk_ibufg), 
				.DSSEN					(1'b0),
				.PSCLK					(1'b0), 
				.PSEN					(1'b0), 
				.PSINCDEC				(1'b0), 
				.RST					(in_reset),
				.CLKDV					(clkdv),
				.CLKFX					(), 
				.CLKFX180				(), 
				.CLK0					(clk0), 
				.CLK2X					(clk2x), 
				.CLK2X180				(), 
				.CLK90					(), 
				.CLK180					(), 
				.CLK270					(), 
				.LOCKED					(dcm_locked), 
				.PSDONE					(), 
				.STATUS					()
			);

	// -------------------------
	//  reset
	// -------------------------
	
	reg		[1:0]		reg_reset;
	always @ ( posedge clk0_bufg or posedge in_reset ) begin
		if ( in_reset ) begin
			reg_reset <= 2'b11;
		end
		else begin
			if ( !dcm_locked ) begin
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
	always @ ( posedge clk2x_bufg or posedge in_reset ) begin
		if ( in_reset ) begin
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
	
	
	
	assign out_clk      = clk0_bufg;
	assign out_clk_x2   = clk2x_bufg;
	assign out_clk_uart = uart_clk_dv;
	assign out_reset    = reg_reset[0];
	
	assign locked       = dcm_locked;

	
endmodule

