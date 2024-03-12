`ifndef _dpram_v_
`define _dpram_v_

/*
 * write 2-bits at a time, read 16-bits.
 * This allows the block ram to be used as
 * a clock-crossing shift register.
 */
module dpram_2x16(
        // read domain
        input rd_clk,
        input [7:0] rd_addr,
        output [15:0] rd_data,
        // write domain
        input wr_clk,
        input wr_enable,
        input [10:0] wr_addr,
        input [1:0] wr_data
);
`define RAM4k
`ifdef RAM4k
	// RAM port mappings from https://github.com/YosysHQ/nextpnr/issues/1118
	// the weird shuffling might have something to do with how the tiles
	// are physically routed?
	wire [10:0] RADDR = {3'b000, rd_addr[7:0]};
	wire [10:0] WADDR = {wr_addr[0], wr_addr[1], wr_addr[2], wr_addr[10:3]};

	wire [15:0] RDATA = {
		rd_data[15], rd_data[ 7], rd_data[11], rd_data[ 3],
		rd_data[13], rd_data[ 5], rd_data[ 9], rd_data[ 1],
		rd_data[14], rd_data[ 6], rd_data[10], rd_data[ 2],
		rd_data[12], rd_data[ 4], rd_data[ 8], rd_data[ 0]
	};

	wire [15:0] WDATA = {
		1'b0,       1'b0, 1'b0, 1'b0,
		wr_data[1], 1'b0, 1'b0, 1'b0,
		1'b0,       1'b0, 1'b0, 1'b0,
		wr_data[0], 1'b0, 1'b0, 1'b0
	};

	parameter LOCATION="";
	(* BEL=LOCATION *)
        SB_RAM40_4K #(
                .WRITE_MODE(3), // x2
                .READ_MODE(0) // x16
        ) ram256x16_0 (
                .RDATA(RDATA),
                .RADDR(RADDR),
                .RCLK(rd_clk),
                .RCLKE(1'b1),
                .RE(1'b1),
                .WADDR(WADDR),
                .WCLK(wr_clk),
                .WCLKE(wr_enable), // 1'b1),
                .WE(1'b1), // wr_enable),
                .WDATA(WDATA)
	);
`else
	// this is the non-primitive version, just in case
	reg [1:0] ram[0:2047];
	reg [15:0] rd_data;

	always @(posedge wr_clk)
		if (wr_clk)
			ram[wr_addr] <= wr_data;
	always @(posedge rd_clk)
		rd_data <= {
			ram[{rd_addr, 3'b111}],
			ram[{rd_addr, 3'b110}],
			ram[{rd_addr, 3'b101}],
			ram[{rd_addr, 3'b100}],
			ram[{rd_addr, 3'b011}],
			ram[{rd_addr, 3'b010}],
			ram[{rd_addr, 3'b001}],
			ram[{rd_addr, 3'b000}]
		};
`endif
endmodule

`endif
