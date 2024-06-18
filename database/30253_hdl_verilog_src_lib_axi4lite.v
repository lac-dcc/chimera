// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2020-06-03 by mza
// updated 2020-06-04 by mza
// last updated 2021-02-13 by mza

module spi_peripheral_axi4lite_controller__pollable_memory_axi4lite_peripheral__tb;
	localparam ADDRESS_WIDTH = 4;
	localparam DATA_WIDTH = 32;
	reg clock = 0;
	reg reset = 1;
	reg [ADDRESS_WIDTH-1:0] pre_spi_write_address = 0;
	reg [ADDRESS_WIDTH-1:0] spi_write_address = 0;
	reg [DATA_WIDTH-1:0] pre_spi_write_data = 0;
	reg [DATA_WIDTH-1:0] spi_write_data = 0;
	reg pre_spi_write_strobe = 0;
	reg spi_write_strobe = 0;
	reg [ADDRESS_WIDTH-1:0] pre_spi_read_address = 0;
	reg [ADDRESS_WIDTH-1:0] spi_read_address = 0;
	wire [DATA_WIDTH-1:0] spi_read_data;
	reg pre_spi_read_strobe = 0;
	reg spi_read_strobe = 0;
	wire [ADDRESS_WIDTH-1:0] awaddr;
	wire awvalid;
	wire awready;
	wire [DATA_WIDTH-1:0] wdata;
	wire wvalid;
	wire wready;
	wire bresp;
	wire bvalid;
	wire bready;
	wire [ADDRESS_WIDTH-1:0] araddr;
	wire arvalid;
	wire arready;
	wire [DATA_WIDTH-1:0] rdata;
	wire rvalid;
	wire rready;
	spi_peripheral__axi4lite_controller #(.ADDRESS_WIDTH(ADDRESS_WIDTH), .DATA_WIDTH(DATA_WIDTH)) spac (
		.clock(clock), .reset(reset),
		.spi_write_address(spi_write_address), .spi_write_data(spi_write_data), .spi_write_strobe(spi_write_strobe),
		.spi_read_address(spi_read_address),   .spi_read_data(spi_read_data),   .spi_read_strobe(spi_read_strobe),
		.awaddr(awaddr), .awvalid(awvalid), .awready(awready),
		.wdata(wdata),   .wvalid(wvalid),   .wready(wready),
		.bresp(bresp),   .bvalid(bvalid),   .bready(bready),
		.araddr(araddr), .arvalid(arvalid), .arready(arready),
		.rdata(rdata),   .rvalid(rvalid),   .rready(rready)
	);
	pollable_memory__axi4lite_peripheral #(.ADDRESS_WIDTH(ADDRESS_WIDTH), .DATA_WIDTH(DATA_WIDTH)) pmap (
		.clock(clock), .reset(reset),
		.awaddr(awaddr), .awvalid(awvalid), .awready(awready),
		.wdata(wdata),   .wvalid(wvalid),   .wready(wready),
		.bresp(bresp),   .bvalid(bvalid),   .bready(bready),
		.araddr(araddr), .arvalid(arvalid), .arready(arready),
		.rdata(rdata),   .rvalid(rvalid),   .rready(rready)
	);
//	task automatic controller_read_transaction;
//		input [ADDRESS_WIDTH-1:0] address;
	task automatic controller_read_transaction(input [ADDRESS_WIDTH-1:0] address);
		begin
			#100;
			pre_spi_read_address <= address;
			pre_spi_read_strobe <= 1;
			#10;
			pre_spi_read_strobe <= 0;
		end
	endtask
//	task automatic controller_write_transaction;
//		input [ADDRESS_WIDTH-1:0] address;
//		input [DATA_WIDTH-1:0] data;
	task automatic controller_write_transaction(input [ADDRESS_WIDTH-1:0] address, input [DATA_WIDTH-1:0] data);
		begin
			#100;
			pre_spi_write_address <= address;
			pre_spi_write_data <= data;
			pre_spi_write_strobe <= 1;
			#10;
			pre_spi_write_strobe <= 0;
		end
	endtask
	initial begin
		#100; reset <= 0;
		#100; controller_write_transaction(4'h2, 32'h12345678);
		#100; controller_write_transaction(4'h3, 32'habcdef01);
		#100; controller_write_transaction(4'hc, 32'h55550000);
		#100; controller_write_transaction(4'hd, 32'h00aa00aa);
		#100; controller_read_transaction(4'h2);
		#100; controller_read_transaction(4'h3);
		#100; controller_read_transaction(4'hc);
		#100; controller_read_transaction(4'hd);
		#200; $finish;
	end
	always @(posedge clock) begin
		spi_write_address <= pre_spi_write_address;
		spi_write_data    <= pre_spi_write_data;
		spi_write_strobe  <= pre_spi_write_strobe;
		spi_read_address <= pre_spi_read_address;
		spi_read_strobe  <= pre_spi_read_strobe;
	end
	always begin
		#5;
		clock <= ~clock;
	end
endmodule

module spi_peripheral__axi4lite_controller #(
//module axi4lite_controller #(
	parameter ADDRESS_WIDTH = 4,
	parameter DATA_WIDTH = 32
) (
	input clock,
	input reset,
	// SPI write channel
	input [ADDRESS_WIDTH-1:0] spi_write_address,
	input [DATA_WIDTH-1:0] spi_write_data,
	input spi_write_strobe,
	// SPI read channel
	input [ADDRESS_WIDTH-1:0] spi_read_address,
	output reg [DATA_WIDTH-1:0] spi_read_data = 0,
	input spi_read_strobe,
	// axi4lite Write Address channel (AW)
	output reg [ADDRESS_WIDTH-1:0] awaddr = 0, // Address of the first beat of the burst
	// awprot
	output reg awvalid = 0, // xVALID handshake signal
	input awready, // xREADY handshake signal
	// axi4lite Write Data channel (W)
	output reg [DATA_WIDTH-1:0] wdata = 0, // Read/Write data
	//output wlast, // Last beat identifier
	// wstrb, // Byte strobe, to indicate which bytes of the WDATA signal are valid
	output reg wvalid = 0, // xVALID handshake signal
	input wready, // xREADY handshake signal
	// axi4lite Write Response channel (B)
	input bresp, // Write response, to specify the status of the burst
	input bvalid, // xVALID handshake signal
	output reg bready = 0, // xREADY handshake signal
	// axi4lite Read Address channel (AR)
	output reg [ADDRESS_WIDTH-1:0] araddr = 0, // Address of the first beat of the burst
	// arprot, // Protection type: privilege, security level and data/instruction access
	output reg arvalid = 0, // xVALID handshake signal
	input arready, // xREADY handshake signal
	// axi4lite Read Data channel (R)
	input [DATA_WIDTH-1:0] rdata, // Read/Write data
//	input reg rresp, // Read response, to specify the status of the current RDATA signal
	//input rlast, // Last beat identifier
	input rvalid, // xVALID handshake signal
	output reg rready = 0 // xREADY handshake signal);
);
	reg [ADDRESS_WIDTH-1:0] pre_awaddr = 0;
	reg pre_awvalid = 0;
	reg [DATA_WIDTH-1:0] pre_wdata = 0;
	reg pre_wvalid  = 0;
	reg [ADDRESS_WIDTH-1:0] pre_araddr = 0;
	reg pre_arvalid = 0;
	reg [2:0] rstate = 0;
	reg [3:0] wstate = 0;
	reg [ADDRESS_WIDTH-1:0] local_spi_write_address = 0;
	reg [DATA_WIDTH-1:0] local_spi_write_data = 0;
	reg [ADDRESS_WIDTH-1:0] local_spi_read_address = 0;
	reg [DATA_WIDTH-1:0] local_spi_read_data = 0;
	reg last_write_was_succecssful = 0;
//	axi4lite_handshake awhandshake (.clock(clock), .reset(reset), .ready(awready), .valid_in(pre_awvalid), .valid_out(awvalid));
//	axi4lite_handshake whandshake (.clock(clock), .reset(reset), .ready(wready), .valid_in(pre_wvalid), .valid_out(wvalid));
//	axi4lite_handshake arhandshake (.clock(clock), .reset(reset), .ready(arready), .valid_in(pre_arvalid), .valid_out(arvalid));
	always @(posedge clock) begin
		if (reset) begin
			pre_awaddr  <= 0;
			pre_awvalid <= 0;
			pre_wdata   <= 0;
			pre_wvalid  <= 0;
			bready  <= 0;
			pre_araddr  <= 0;
			pre_arvalid <= 0;
			rready  <= 0;
			wstate <= 0;
			rstate <= 0;
			last_write_was_succecssful <= 0;
			spi_read_data <= 0;
		end else begin
			awvalid <= pre_awvalid;
			awaddr  <= pre_awaddr;
			wvalid  <= pre_wvalid;
			wdata   <= pre_wdata;
			araddr  <= pre_araddr;
			arvalid <= pre_arvalid;
			// write
			if (wstate[3:1]==0) begin
				if (wstate[0]==0) begin
					if (spi_write_strobe) begin
						local_spi_write_address <= spi_write_address;
						local_spi_write_data    <= spi_write_data;
						wstate[0] <= 1;
					end
				end else begin
					pre_awaddr <= local_spi_write_address;
					pre_awvalid <= 1;
					pre_wdata <= local_spi_write_data;
					pre_wvalid <= 1;
					bready <= 1;
					wstate[3:1] <= 3'b111;
				end
			end else begin
				wstate[0] <= 0;
				if (wstate[1]) begin
					if (awready) begin
						pre_awvalid <= 0;
						wstate[1] <= 0;
					end
				end
				if (wstate[2]) begin
					if (wready) begin
						pre_wvalid <= 0;
						wstate[2] <= 0;
					end
				end
				if (wstate[3]) begin
					if (bvalid) begin
						last_write_was_succecssful <= bresp;
						bready <= 0;
						wstate[3] <= 0;
					end
				end
			end
			// read
			if (rstate[2:1]==0) begin
				if (rstate[0]==0) begin
					if (spi_read_strobe) begin
						local_spi_read_address <= spi_read_address;
						rstate[0] <= 1;
					end
				end else begin
					pre_araddr <= local_spi_read_address;
					pre_arvalid <= 1;
					rready <= 1;
					rstate[2:1] <= 2'b11;
				end
			end else begin
				rstate[0] <= 0;
				if (rstate[1]) begin
					if (arready) begin
						pre_arvalid <= 0;
						rstate[1] <= 0;
					end
				end
				if (rstate[2]) begin
					if (rvalid) begin
						spi_read_data <= rdata;
						rready <= 0;
						rstate[2] <= 0;
					end
				end
			end
		end
	end
endmodule

// definitions from https://en.wikipedia.org/wiki/Advanced_eXtensible_Interface
module pollable_memory__axi4lite_peripheral #(
	parameter ADDRESS_WIDTH = 4,
	parameter DATA_WIDTH = 32
) (
	input clock,
	input reset,
	// axi4lite Write Address channel (AW)
	input [ADDRESS_WIDTH-1:0] awaddr, // Address of the first beat of the burst
	// awprot
	input awvalid, // xVALID handshake signal
	output reg awready = 0, // xREADY handshake signal
	// axi4lite Write Data channel (W)
	input [DATA_WIDTH-1:0] wdata, // Read/Write data
	//input wlast, // Last beat identifier
	// wstrb, // Byte strobe, to indicate which bytes of the WDATA signal are valid
	input wvalid, // xVALID handshake signal
	output reg wready = 0, // xREADY handshake signal
	// axi4lite Write Response channel (B)
	output reg bresp = 0, // Write response, to specify the status of the burst
	output reg bvalid = 0, // xVALID handshake signal
	input bready, // xREADY handshake signal
	// axi4lite Read Address channel (AR)
	input [ADDRESS_WIDTH-1:0] araddr, // Address of the first beat of the burst
	// arprot, // Protection type: privilege, security level and data/instruction access
	input arvalid, // xVALID handshake signal
	output reg arready = 0, // xREADY handshake signal
	// axi4lite Read Data channel (R)
	output reg [DATA_WIDTH-1:0] rdata = 0, // Read/Write data
//	output reg rresp = 0, // Read response, to specify the status of the current RDATA signal
	//output rlast, // Last beat identifier
	output reg rvalid = 0, // xVALID handshake signal
	input rready // xREADY handshake signal
);
	reg [2:0] wstate = 0;
	reg [ADDRESS_WIDTH-1:0] local_awaddr = 0;
	reg [DATA_WIDTH-1:0] local_wdata = 0;
	reg pre_bresp   = 0;
	reg pre_bvalid  = 0;
	reg [1:0] rstate = 0;
	reg [ADDRESS_WIDTH-1:0] local_araddr = 0;
	reg pre_arready = 0;
	reg [DATA_WIDTH-1:0] pre_rdata = 0;
//	reg pre_rresp  = 0;
	reg pre_rvalid = 0;
	reg [DATA_WIDTH-1:0] mem [2**ADDRESS_WIDTH-1:0];
	always @(posedge clock) begin
//		pre_bresp   <= 0;
//		pre_bvalid  <= 0;
//		pre_arready <= 0;
//		pre_rdata   <= 0;
//		pre_rresp   <= 0;
//		pre_rvalid  <= 0;
		if (reset) begin
			wstate <= 0;
			local_awaddr <= 0;
			awready <= 1;
			local_wdata <= 0;
			wready <= 1;
			local_araddr <= 0;
			arready <= 1;
			pre_bresp   <= 0;
			pre_bvalid  <= 0;
			pre_arready <= 1;
			pre_rdata   <= 0;
//			pre_rresp   <= 0;
			pre_rvalid  <= 0;
		end else begin
			bresp   <= pre_bresp;
			bvalid  <= pre_bvalid;
			arready <= pre_arready;
			rdata   <= pre_rdata;
//			rresp   <= pre_rresp;
			rvalid  <= pre_rvalid;
			// write
			if (wstate[2]==0) begin
				if (wstate[1:0]==2'b11) begin
					mem[local_awaddr] <= local_wdata;
					pre_bresp <= 1;
					pre_bvalid <= 1;
					wstate[2] <= 1;
				end
				if (awvalid) begin
					local_awaddr <= awaddr;
					awready <= 0;
					wstate[0] <= 1;
				end
				if (wvalid) begin
					local_wdata <= wdata;
					wready <= 0;
					wstate[1] <= 1;
				end
			end else begin
				wstate[1:0] <= 0;
				if (bready) begin
					pre_bresp <= 0;
					pre_bvalid <= 0;
					awready <= 1;
					wready <= 1;
					wstate[2] <= 0;
				end
			end
			// read
			if (rstate[1]==0) begin
				if (rstate[0]==0) begin
					if (arvalid) begin
						local_araddr <= araddr;
						arready <= 0;
						rstate[0] <= 1;
					end
				end else begin
					pre_rdata <= mem[local_araddr];
					pre_rvalid <= 1;
					rstate[1] <= 1;
				end
			end else begin
				rstate[0] <= 0;
				if (rready) begin
					pre_rvalid <= 0;
//					pre_rresp <= ;
					arready <= 1;
					rstate[1] <= 0;
				end
			end
		end
	end
endmodule


module axi4lite_handshake (
	input clock,
	input reset,
	input ready,
	input valid_in,
	output reg valid_out = 0
);
	reg state = 0;
	always @(posedge clock) begin
		if (reset) begin
			valid_out <= 0;
			state <= 0;
		end else begin
			if (state==0) begin
				if (valid_in) begin
					valid_out <= 1;
					state <= 1;
				end
			end else begin
				if (ready) begin
					valid_out <= 0;
					state <= 0;
				end
			end
		end
	end
endmodule

module pollable_memory_axi4lite_peripheral_tb;
	localparam ADDRESS_WIDTH = 4;
	localparam DATA_WIDTH = 32;
	reg clock = 0;
	reg reset = 1;
	reg [ADDRESS_WIDTH-1:0] pre_awaddr = 0;
	reg [ADDRESS_WIDTH-1:0] awaddr = 0;
	reg pre_awvalid = 0;
	wire awvalid;
	wire awready;
	reg [DATA_WIDTH-1:0] pre_wdata = 0;
	reg [DATA_WIDTH-1:0] wdata = 0;
	reg pre_wvalid = 0;
	wire wvalid;
	wire wready;
	wire bresp;
	wire bvalid;
	reg pre_bready = 1;
	reg bready = 1;
	reg [ADDRESS_WIDTH-1:0] pre_araddr = 0;
	reg [ADDRESS_WIDTH-1:0] araddr = 0;
	reg pre_arvalid = 0;
	wire arvalid;
	wire arready;
	wire [DATA_WIDTH-1:0] rdata;
//	wire rresp;
	wire rvalid;
	reg pre_rready = 1;
	reg rready = 1;
	pollable_memory__axi4lite_peripheral #(.ADDRESS_WIDTH(ADDRESS_WIDTH), .DATA_WIDTH(DATA_WIDTH)) pmap (
		.clock(clock), .reset(reset),
		.awaddr(awaddr), .awvalid(awvalid), .awready(awready),
		.wdata(wdata), .wvalid(wvalid), .wready(wready),
		.bresp(bresp), .bvalid(bvalid), .bready(bready),
		.araddr(araddr), .arvalid(arvalid), .arready(arready),
		.rdata(rdata), .rvalid(rvalid), .rready(rready)
	);
	axi4lite_handshake awhandshake (.clock(clock), .reset(reset), .ready(awready), .valid_in(pre_awvalid), .valid_out(awvalid));
	axi4lite_handshake whandshake  (.clock(clock), .reset(reset), .ready(wready),  .valid_in(pre_wvalid),  .valid_out(wvalid));
	axi4lite_handshake arhandshake (.clock(clock), .reset(reset), .ready(arready), .valid_in(pre_arvalid), .valid_out(arvalid));
	task automatic controller_read_transaction;
		input [ADDRESS_WIDTH-1:0] address;
		begin
			#100;
			pre_araddr <= address;
			pre_arvalid <= 1;
			#10;
			pre_arvalid <= 0;
		end
	endtask
	task automatic controller_write_transaction;
		input [ADDRESS_WIDTH-1:0] address;
		input [DATA_WIDTH-1:0] data;
		begin
			#100;
			pre_awaddr <= address;
			pre_awvalid <= 1;
			#10;
			pre_awvalid <= 0;
			#100;
			pre_wdata <= data;
			pre_wvalid <= 1;
			#10;
			pre_wvalid <= 0;
//			#30;
//			if (bvalid) begin
	//			if (bresp) begin
	//			end
//				pre_bready <= 0;
//			end
			#100;
			pre_bready <= 1;
		end
	endtask
	initial begin
		#100;
		reset <= 0;
		pre_awaddr <= 0;
		pre_awvalid <= 0;
		pre_wdata <= 0;
		pre_wvalid <= 0;
		pre_bready <= 1;
		pre_araddr <= 0;
		pre_arvalid <= 0;
		pre_rready <= 1;
		#100; controller_write_transaction(4'h2, 32'h12345678);
		#100; controller_write_transaction(4'h5, 32'habcdef01);
		#100; controller_write_transaction(4'he, 32'h55550000);
		#100; controller_write_transaction(4'hc, 32'h00aa00aa);
		#100; controller_read_transaction(4'h2);
		#100; controller_read_transaction(4'hc);
		#100; controller_read_transaction(4'he);
		#100; controller_read_transaction(4'hc);
		#100; $finish;
	end
	always @(posedge clock) begin
		awaddr <= pre_awaddr;
		wdata  <= pre_wdata;
		bready <= pre_bready;
		araddr <= pre_araddr;
		rready <= pre_rready;
	end
	always begin
		#5;
		clock <= ~clock;
	end
endmodule

