// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

module diskdrives#(parameter NR_DISK = 2, parameter SHARED_FDC = 0) (
	// from/to ctrl-module
	input wire[7:0] disk_data_in,
	output wire[7:0] disk_data_out,
	output wire[31:0] disk_sr,
	input wire[31:0] disk_cr,
	input wire disk_data_clkout,
	input wire disk_data_clkin,
	input wire[1:0] disk_wp,
	
	// from/to sam
	input wire disk1_n,
	input wire disk2_n,
	input wire[2:0] cpuaddr,
	input wire rd_n,
	input wire wr_n,
	input wire[7:0] data_from_cpu,
	output wire[7:0] wd1770_dout,
	output wire[7:0] wd1770_dout2,

	// clocks and misc other
	input wire rstn,
	input wire clk12,
	input wire clk24
);
	
	generate if (SHARED_FDC == 1) begin
	assign wd1770_dout2 = wd1770_dout;
	wd1770 wd1770_inst(
		.dd0in(disk_data_in),
		.dd0inclk(disk_data_clkin),
		.dd0out(disk_data_out),
		.dd0outclk(disk_data_clkout),
		.dsr(disk_sr),
		.dcr(disk_cr),
		.drsel(disk1_n),
		.drwp({disk_wp[0], disk_wp[1]}),

		.clk(clk12),

		// interface to cpu
		.din(data_from_cpu[7:0]),
		.dout(wd1770_dout[7:0]),
		.a1_0(cpuaddr[1:0]),
		.rd(!(disk1_n && disk2_n) && !rd_n),
		.wr(!(disk1_n && disk2_n) && !wr_n),
		.rstn(rstn),
		.side(cpuaddr[2])
		);
	end endgenerate
	
	
	reg wd1770_switch = 1'b0;
	wire[7:0] disk_data_out1;
	wire[7:0] disk_data_out2;
	wire[31:0] disk_sr1;
	wire[31:0] disk_sr2;
	generate if (SHARED_FDC == 0) begin
	reg prev_disk1_n = 1'b1;
	reg prev_disk2_n = 1'b1;
	always @(posedge clk24) begin
		{prev_disk1_n, prev_disk2_n} <= {disk1_n, disk2_n};
		if (!disk1_n && prev_disk1_n) wd1770_switch <= 1'b0;
		if (!disk2_n && prev_disk2_n) wd1770_switch <= 1'b1;
	end

	assign disk_data_out = wd1770_switch ? disk_data_out2 : disk_data_out1;
	assign disk_sr = wd1770_switch ? disk_sr2: disk_sr1;

	wd1770 wd1770_inst(
		.dd0in(disk_data_in),
		.dd0inclk(disk_data_clkin & ~wd1770_switch),
		.dd0out(disk_data_out1),
		.dd0outclk(disk_data_clkout & ~wd1770_switch),
		.dsr(disk_sr1),
		.dcr(wd1770_switch ? 32'd0 : disk_cr),
		.drsel(1'b1),
		.drwp({1'b1, disk_wp[0]}),

		.clk(clk12),

		// interface to cpu
		.din(data_from_cpu[7:0]),
		.dout(wd1770_dout[7:0]),
		.a1_0(cpuaddr[1:0]),
		.rd(!disk1_n && !rd_n),
		.wr(!disk1_n && !wr_n),
		.rstn(rstn),
		.side(cpuaddr[2])
		);
  end endgenerate

	generate if (NR_DISK == 2 && SHARED_FDC == 0) begin
	wd1770 wd1770_inst2(
		.dd0in(disk_data_in),
		.dd0inclk(disk_data_clkin & wd1770_switch),
		.dd0out(disk_data_out2),
		.dd0outclk(disk_data_clkout & wd1770_switch),
		.dsr(disk_sr2),
		.dcr(wd1770_switch ? disk_cr : 32'd0),
		.drsel(1'b0),
		.drwp({disk_wp[1], 1'b0}),

		.clk(clk12),

		// interface to cpu
		.din(data_from_cpu[7:0]),
		.dout(wd1770_dout2[7:0]),
		.a1_0(cpuaddr[1:0]),
		.rd(!disk2_n && !rd_n),
		.wr(!disk2_n && !wr_n),
		.rstn(rstn),
		.side(cpuaddr[2])
		);
  end endgenerate;

endmodule

