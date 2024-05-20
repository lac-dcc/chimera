// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/*
 * user_module_341426151397261906.v
 */

`default_nettype none

module user_module_341426151397261906 (
	input  wire        latch_in,
	input  wire  [7:0] io_in,
	output wire  [7:0] io_out
);

	// Signals
	// -------

	// IO extension
	wire [31:0] eio_in;
	wire [31:0] eio_out;
	wire  [7:0] eio_latch_n;

	wire        clk_slow;


	// IO extension
	// ------------

	// Input 0 is slow clock, keep as-is
	sky130_fd_sc_hd__dlxtp_1 in_clk_slow_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.D    (io_in[0]),
		.GATE (latch_in),
		.Q    (clk_slow)
	);

	// Input [3:1] is 'address'
		// Group 0
	sky130_fd_sc_hd__or4b_1 in_dec_0_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[1]),
		.B    (io_in[2]),
		.C    (io_in[3]),
		.D_N  (latch_in),
		.X    (eio_latch_n[0])
	);

		// Group 1
	sky130_fd_sc_hd__nand4bb_1 in_dec_1_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A_N  (io_in[3]),
		.B_N  (io_in[2]),
		.C    (io_in[1]),
		.D    (latch_in),
		.Y    (eio_latch_n[1])
	);

		// Group 2
	sky130_fd_sc_hd__nand4bb_1 in_dec_2_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A_N  (io_in[3]),
		.B_N  (io_in[1]),
		.C    (io_in[2]),
		.D    (latch_in),
		.Y    (eio_latch_n[2])
	);

		// Group 3
	sky130_fd_sc_hd__nand4b_1 in_dec_3_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A_N  (io_in[3]),
		.B    (io_in[2]),
		.C    (io_in[1]),
		.D    (latch_in),
		.Y    (eio_latch_n[3])
	);

		// Group 4
	sky130_fd_sc_hd__nand4bb_1 in_dec_4_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A_N  (io_in[1]),
		.B_N  (io_in[2]),
		.C    (io_in[3]),
		.D    (latch_in),
		.Y    (eio_latch_n[4])
	);

		// Group 5
	sky130_fd_sc_hd__nand4b_1 in_dec_5_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A_N  (io_in[2]),
		.B    (io_in[1]),
		.C    (io_in[3]),
		.D    (latch_in),
		.Y    (eio_latch_n[5])
	);

		// Group 6
	sky130_fd_sc_hd__nand4b_1 in_dec_6_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A_N  (io_in[1]),
		.B    (io_in[2]),
		.C    (io_in[3]),
		.D    (latch_in),
		.Y    (eio_latch_n[6])
	);

		// Group 7
	sky130_fd_sc_hd__nand4_1 in_dec_7_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[1]),
		.B    (io_in[2]),
		.C    (io_in[3]),
		.D    (latch_in),
		.Y    (eio_latch_n[7])
	);

	// Input [7:4] is data
	genvar i;
	generate
		for (i=0; i<8; i=i+1) begin
			sky130_fd_sc_hd__dlxtn_1 in_latch_I[3:0] (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.D      (io_in[7:4]),
				.GATE_N (eio_latch_n[i]),
				.Q      (eio_in[i*4+:4])
			);
		end
	endgenerate

	// Output mux
	sky130_fd_sc_hd__mux4_1 out_mux_I[7:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A0   (eio_out[ 7: 0]),
		.A1   (eio_out[15: 8]),
		.A2   (eio_out[23:16]),
		.A3   (eio_out[31:24]),
		.X    (io_out),
		.S0   (eio_in[0]),
		.S1   (eio_in[1])
	);


	// RAM instance
	// ------------

	ram_top_341426151397261906  #(
		.W(8)
	) ram_I (
		.waddr (eio_in[7:4]),
		.wdata (eio_in[19:12]),
		.we    (eio_in[2]),
		.raddr (eio_in[11:8]),
		.re    (eio_in[3]),
		.rdata (eio_out[7:0]),
		.clk   (clk_slow)
	);


	// Fixed output
	// ------------

	assign eio_out[31:24] = 8'ha5;
	assign eio_out[23:16] = eio_in[11:4];
	assign eio_out[15: 8] = eio_in[19:12];

endmodule // user_module_341426151397261906



module ram_top_341426151397261906 #(
	parameter integer W = 4
)(
	input  wire   [3:0] waddr,
	input  wire [W-1:0] wdata,
	input  wire         we,
	input  wire   [3:0] raddr,
	input  wire         re,
	output wire [W-1:0] rdata,
	input  wire         clk
);

	genvar i;

	// Signals
	// -------

	// Write path
	wire   [3:0] waddr_r;
	wire [W-1:0] wdata_r;
	wire         we_r;

	wire  [15:0] waddr_dec;

	// Storage
	wire [W-1:0] store_in;
	wire [W-1:0] store_data[0:15];
	wire  [15:0] store_gate;

	// Read path
	wire   [3:0] raddr_r;
	wire         re_r;

	wire   [3:0] raddr_msb_dec;

	wire [W-1:0] rdata_tbuf;
	wire [W-1:0] rdata_inv;
	wire         rdata_le_n;
	wire         clk_dly;


	// Write path
	// ----------

	// Register wdata, waddr, we

		// Maybe we could get away with some latches, but for timing
		// analysis PoV it's easier to have termination point that are FFs

	sky130_fd_sc_hd__dfxtp_1 waddr_reg_I[3:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.CLK  (clk),
		.D    (waddr),
		.Q    (waddr_r)
	);

	sky130_fd_sc_hd__dfxtp_1 wdata_reg_I[W-1:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.CLK  (clk),
		.D    (wdata),
		.Q    (wdata_r)
	);

	sky130_fd_sc_hd__dfxtp_1 we_reg_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.CLK  (clk),
		.D    (we),
		.Q    (we_r)
	);

	// Decode address to one hot signals
	ram_dec4_341426151397261906 waddr_dec_I (
		.in  (waddr_r),
		.out (waddr_dec)
	);

	// Generate write pulses
	ram_wpulse_341426151397261906 #(
		.N(16)
	) wpulse_I (
		.clk      (clk),
		.we       (we_r),
		.addr_dec (waddr_dec),
		.dly      (2'b11),	// FIXME
		.wpulse   (store_gate)
	);

	// Send data to store array
	assign store_in = wdata_r;


	// Storage array
	// -------------

	generate
		for (i=0; i<16; i=i+1)
		begin : store_cell_loop

			wire [W-1:0] l_store_data;

			sky130_fd_sc_hd__dlxtp_1 store_cell_I[W-1:0] (
`ifdef WITH_POWER
				.VPWR   (1'b1),
				.VGND   (1'b0)
`endif
				.D      (store_in),
				.GATE   (store_gate[i]),
				.Q      (l_store_data)
			);

			assign store_data[i] = l_store_data;

		end
	endgenerate


	// Read path
	// ---------

	// Register wdata, waddr, we

		// Maybe we could get away with some latches, but for timing
		// analysis PoV it's easier to have termination point that are FFs

	sky130_fd_sc_hd__dfxtp_1 raddr_reg_msb_I[1:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.CLK  (clk),
		.D    (raddr[3:2]),
		.Q    (raddr_r[3:2])
	);

	sky130_fd_sc_hd__dfxtp_4 raddr_reg_lsb_I[1:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.CLK  (clk),
		.D    (raddr[1:0]),
		.Q    (raddr_r[1:0])
	);

	sky130_fd_sc_hd__dfxtp_1 re_reg_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.CLK  (clk),
		.D    (re),
		.Q    (re_r)
	);

	// Decode MSB
	ram_dec2_341426151397261906 raddr_dec_I (
		.in (raddr_r[3:2]),
		.out(raddr_msb_dec)
	);

	// Select path by group of 4
	generate
		for (i=0; i<16; i=i+4)
		begin : rdata_sel_loop

			wire [W-1:0] l_in0_mux;
			wire [W-1:0] l_in1_mux;
			wire [W-1:0] l_in2_mux;
			wire [W-1:0] l_in3_mux;
			wire [W-1:0] l_out_mux;

			// Pickup data
			assign l_in0_mux = store_data[i+0];
			assign l_in1_mux = store_data[i+1];
			assign l_in2_mux = store_data[i+2];
			assign l_in3_mux = store_data[i+3];

			// Generate mux4 for each group
			sky130_fd_sc_hd__mux4_1 rdata_mux_I[W-1:0] (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.A0   (l_in0_mux),
				.A1   (l_in1_mux),
				.A2   (l_in2_mux),
				.A3   (l_in3_mux),
				.X    (l_out_mux),
				.S0   (raddr_r[0]),
				.S1   (raddr_r[1])
			);

			// Then use tristate buffers
			sky130_fd_sc_hd__einvp_2 rdata_tbuf_I[W-1:0] (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.A    (l_out_mux),
				.TE   (raddr_msb_dec[i/4]),
				.Z    (rdata_tbuf)
			);

		end
	endgenerate

	// And final output latch/buffer
`ifdef SIM
	assign #1.5 clk_dly = clk;
`else
	sky130_fd_sc_hd__clkdlybuf4s50_1 clk_dly_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (clk),
		.X    (clk_dly)
	);
`endif

	sky130_fd_sc_hd__nand3_2 data_le_n_I (
`ifdef WITH_POWER
		.VPWR   (1'b1),
		.VGND   (1'b0)
`endif
		.A      (clk),
		.B      (clk_dly),
		.C      (re_r),
		.Y      (rdata_le_n)
	);

	sky130_fd_sc_hd__inv_1 rdata_inv_I[W-1:0] (
`ifdef WITH_POWER
		.VPWR   (1'b1),
		.VGND   (1'b0)
`endif
		.A      (rdata_tbuf),
		.Y      (rdata_inv)
	);

	sky130_fd_sc_hd__dlxtn_4 rdata_latch_I[W-1:0] (
`ifdef WITH_POWER
		.VPWR   (1'b1),
		.VGND   (1'b0)
`endif
		.D      (rdata_inv),
		.GATE_N (rdata_le_n),
		.Q      (rdata)
	);

endmodule // ram_top_341426151397261906



module ram_wpulse_341426151397261906 #(
	parameter integer N = 16
)(
	input  wire         clk,
	input  wire         we,
	input  wire [N-1:0] addr_dec,
	input  wire   [1:0] dly,
	output wire [N-1:0] wpulse
);

	// Signals
	wire [7:0] clk_dly_chain;
	wire       clk_dly;
	wire       pulse;

	// Clock multi delay line
`ifdef SIM
	assign #1 clk_dly_chain[0] = clk;
`else
	assign clk_dly_chain[0] = clk;
`endif

	sky130_fd_sc_hd__clkdlybuf4s25_1 clk_dly_chain_I[6:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (clk_dly_chain[6:0]),
		.X    (clk_dly_chain[7:1])
	);

	// Select delayed version
	sky130_fd_sc_hd__mux4_1 clk_dly_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A0   (clk_dly_chain[1]),
		.A1   (clk_dly_chain[3]),
		.A2   (clk_dly_chain[5]),
		.A3   (clk_dly_chain[7]),
		.X    (clk_dly),
		.S0   (dly[0]),
		.S1   (dly[1])
	);

	// Generate pulse with WE gate
	sky130_fd_sc_hd__and3b_4 pulse_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A_N  (clk),
		.B    (clk_dly),
		.C    (we),
		.X    (pulse)
	);

	// Generate all columns pulses
	sky130_fd_sc_hd__and2_4 wpulse_I[N-1:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (pulse),
		.B    (addr_dec),
		.X    (wpulse)
	);

endmodule // ram_wpulse_341426151397261906



module ram_dec2_341426151397261906 (
	input  wire [1:0] in,
	output wire [3:0] out
);

	sky130_fd_sc_hd__nor2_1 dec_2_0_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[0]),
		.B          (in[1]),
		.Y          (out[0])
	);

	sky130_fd_sc_hd__and2b_1 dec_2_1_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[1]),
		.B          (in[0]),
		.X          (out[1])
	);

	sky130_fd_sc_hd__and2b_1 dec_2_2_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[0]),
		.B          (in[1]),
		.X          (out[2])
	);

	sky130_fd_sc_hd__and2_1 dec_2_3_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[0]),
		.B          (in[1]),
		.X          (out[3])
	);

endmodule // ram_dec2_341426151397261906


module ram_dec4_341426151397261906 (
	input  wire  [3:0] in,
	output wire [15:0] out
);

	sky130_fd_sc_hd__nor4_1 dec_4_0_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[0]),
		.B          (in[1]),
		.C          (in[2]),
		.D          (in[3]),
		.Y          (out[0])
	);

	sky130_fd_sc_hd__nor4b_1 dec_4_1_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[1]),
		.B          (in[2]),
		.C          (in[3]),
		.D_N        (in[0]),
		.Y          (out[1])
	);

	sky130_fd_sc_hd__nor4b_1 dec_4_2_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[0]),
		.B          (in[2]),
		.C          (in[3]),
		.D_N        (in[1]),
		.Y          (out[2])
	);

	sky130_fd_sc_hd__and4bb_1 dec_4_3_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[2]),
		.B_N        (in[3]),
		.C          (in[0]),
		.D          (in[1]),
		.X          (out[3])
	);

	sky130_fd_sc_hd__nor4b_1 dec_4_4_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[0]),
		.B          (in[1]),
		.C          (in[3]),
		.D_N        (in[2]),
		.Y          (out[4])
	);

	sky130_fd_sc_hd__and4bb_1 dec_4_5_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[1]),
		.B_N        (in[3]),
		.C          (in[0]),
		.D          (in[2]),
		.X          (out[5])
	);

	sky130_fd_sc_hd__and4bb_1 dec_4_6_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[0]),
		.B_N        (in[3]),
		.C          (in[1]),
		.D          (in[2]),
		.X          (out[6])
	);

	sky130_fd_sc_hd__and4b_1 dec_4_7_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[3]),
		.B          (in[0]),
		.C          (in[1]),
		.D          (in[2]),
		.X          (out[7])
	);

	sky130_fd_sc_hd__nor4b_1 dec_4_8_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[0]),
		.B          (in[1]),
		.C          (in[2]),
		.D_N        (in[3]),
		.Y          (out[8])
	);

	sky130_fd_sc_hd__and4bb_1 dec_4_9_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[1]),
		.B_N        (in[2]),
		.C          (in[0]),
		.D          (in[3]),
		.X          (out[9])
	);

	sky130_fd_sc_hd__and4bb_1 dec_4_10_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[0]),
		.B_N        (in[2]),
		.C          (in[1]),
		.D          (in[3]),
		.X          (out[10])
	);

	sky130_fd_sc_hd__and4b_1 dec_4_11_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[2]),
		.B          (in[0]),
		.C          (in[1]),
		.D          (in[3]),
		.X          (out[11])
	);

	sky130_fd_sc_hd__and4bb_1 dec_4_12_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[0]),
		.B_N        (in[1]),
		.C          (in[2]),
		.D          (in[3]),
		.X          (out[12])
	);

	sky130_fd_sc_hd__and4b_1 dec_4_13_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[1]),
		.B          (in[0]),
		.C          (in[2]),
		.D          (in[3]),
		.X          (out[13])
	);

	sky130_fd_sc_hd__and4b_1 dec_4_14_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A_N        (in[0]),
		.B          (in[1]),
		.C          (in[2]),
		.D          (in[3]),
		.X          (out[14])
	);

	sky130_fd_sc_hd__and4_1 dec_4_15_I (
`ifdef WITH_POWER
		.VPWR       (1'b1),
		.VGND       (1'b0),
`endif
		.A          (in[0]),
		.B          (in[1]),
		.C          (in[2]),
		.D          (in[3]),
		.X          (out[15])
	);

endmodule // ram_dec4_341426151397261906
