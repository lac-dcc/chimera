// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

/*
 * user_module_341263346544149074.v
 */

`default_nettype none

module user_module_341263346544149074 (
	input  wire  [7:0] io_in,
	output wire  [7:0] io_out
);

	localparam integer DEPTH = 24;

	// Signals
	// -------

	wire       clk;
	wire       rst_n;

	wire [3:0] wr_data;
	wire       wr_ena;
	wire       wr_full;

	wire [3:0] rd_data;
	wire       rd_ena;
	wire       rd_ena_n;
	wire       rd_empty;

	wire       wr_ena_buf;

	wire  [DEPTH+1:0] valid;
	wire  [3:0]       data [DEPTH+1:0];


	// IOs
	// ---

	// Clock
	sky130_fd_sc_hd__clkbuf_4 inbuf_clk_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[0]),
		.X    (clk)
	);

	// Reset
	sky130_fd_sc_hd__buf_4 inbuf_rst_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[1]),
		.X    (rst_n)
	);

	// Write data
	sky130_fd_sc_hd__buf_4 inbuf_wr_data_I[3:0] (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[7:4]),
		.X    (wr_data)
	);

	// Write ena
	sky130_fd_sc_hd__buf_4 inbuf_wr_ena_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[2]),
		.X    (wr_ena)
	);

	// Read enable
	sky130_fd_sc_hd__buf_4 inbuf_rd_ena_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[3]),
		.X    (rd_ena)
	);

	sky130_fd_sc_hd__inv_4 inbuf_rd_ena_n_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (io_in[3]),
		.Y    (rd_ena_n)
	);

	// Outputs
	assign io_out[1:0] = 2'b00;
	assign io_out[2]   = wr_full;
	assign io_out[3]   = rd_empty;
	assign io_out[7:4] = rd_data;


	// Stages
	// ------

	// Generate loop
	genvar i;

	generate
		for (i=1; i<=DEPTH; i=i+1)
		begin : stage
			// Local signals
			wire       l_valid_n;
			wire       l_ce;
			wire       l_clk;

			wire [3:0] l_data_src;
			wire [3:0] l_data_mux;
			wire [3:0] l_data_reg;
			wire       l_valid_comb;
			wire       l_valid_reg;

			// Clock enable for this stage
			// assign l_ce = rd_ena | (wr_ena & ~valid[i] & valid[i-1]);

			sky130_fd_sc_hd__inv_1 valid_n_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.A    (l_valid_reg),
				.Y    (l_valid_n)
			);

			sky130_fd_sc_hd__a31o_1 ce_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.A1   (wr_ena),
				.A2   (l_valid_n),
				.A3   (valid[i-1]),
				.B1   (rd_ena),
				.X    (l_ce)
			);

			sky130_fd_sc_hd__dlclkp_1 clk_gate_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.GATE (l_ce),
				.CLK  (clk),
				.GCLK (l_clk)
			);

			// Data mux
			if (i == DEPTH) begin
				// No mux
				assign l_data_mux = wr_data;
			end else begin
				// Next data
				assign l_data_src = data[i+1];

				// Mux
				sky130_fd_sc_hd__mux2_1 data_mux_I[3:0] (
`ifdef WITH_POWER
					.VPWR (1'b1),
					.VGND (1'b0),
`endif
					.A0   (wr_data),
					.A1   (l_data_src),
					.S    (valid[i+1]),
					.X    (l_data_mux)
				);
			end

			// Data register
			sky130_fd_sc_hd__dfxtp_1 data_reg_I[3:0] (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.D    (l_data_mux),
				.Q    (l_data_reg),
				.CLK  (l_clk)
			);

			// Valid logic
			//assign l_valid_comb = ~rd_ena | valid[i+1] | (wr_ena & valid[i]);
			sky130_fd_sc_hd__a211o_1 valid_comb_I (
`ifdef WITH_POWER
				.VPWR (1'b1),
				.VGND (1'b0),
`endif
				.A1   (wr_ena),
				.A2   (valid[i]),
				.B1   (valid[i+1]),
				.C1   (rd_ena_n),
				.X    (l_valid_comb)
			);

			// Valid register
			sky130_fd_sc_hd__dfrtp_1 valid_reg_I (
`ifdef WITH_POWER
				.VPWR    (1'b1),
				.VGND    (1'b0),
`endif
				.D       (l_valid_comb),
				.Q       (l_valid_reg),
				.CLK     (l_clk),
				.RESET_B (rst_n)
			);

			// Map
			assign data[i]  = l_data_reg;
			assign valid[i] = l_valid_reg;

		end
	endgenerate

	// Boundary conditions
	assign data[DEPTH+1] = wr_data;
	assign data[0] = { 4'hx };

	assign valid[DEPTH+1] = 1'b0;
	assign valid[0] = 1'b1;


	// User IF
	// -------

	assign wr_full = valid[DEPTH];

	assign rd_data  = data[1];

	sky130_fd_sc_hd__inv_1 empty_I (
`ifdef WITH_POWER
		.VPWR (1'b1),
		.VGND (1'b0),
`endif
		.A    (valid[1]),
		.Y    (rd_empty)
	);

endmodule // user_module_341263346544149074
