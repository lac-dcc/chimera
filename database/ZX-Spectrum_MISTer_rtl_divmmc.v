// divmmc

//
// Total refactoring. Made module synchroneous. (Sorgelig)
//

module divmmc
(
    input         clk_sys,
    input   [1:0] mode, //00-off, 01-divmmc, 10-zxmmc, 11-divmmc+esxdos
    output        ready,

    // CPU interface
    input         nWR,
    input         nRD,
    input         nMREQ,
    input         nRFSH,
    input         nIORQ,
    input         nM1,
    input  [15:0] addr,
    input   [7:0] din,
    output  [7:0] dout,

    // control
    input         disable_pagein,
    output        active_io,

    output        rom_active,
    output        ram_active,
    output  [3:0] ram_bank,

    // SD/MMC SPI
    input         spi_ce,
    output reg    spi_ss,
    output        spi_clk,
    input         spi_di,
    output        spi_do
);

wire      io_we = ~nIORQ & ~nWR & nM1;
wire      io_rd = ~nIORQ & ~nRD & nM1;
wire      m1    = ~nMREQ & ~nM1;

// Edge detectors
reg       old_we, old_rd, old_m1;

always @(posedge clk_sys) begin
	old_we <= io_we;
	old_rd <= io_rd;
	old_m1 <= m1;
end

// SPI handling
assign    active_io   = port_io;

wire      port_cs = ((mode[0]      ) && (addr[7:0] == 8'hE7)) ||
                    ((mode == 2'b10) && (addr[7:0] == 8'h1F));
wire      port_io = ((mode[0]      ) && (addr[7:0] == 8'hEB)) ||
                    ((mode == 2'b10) && (addr[7:0] == 8'h3F));

reg       tx_strobe;
reg       rx_strobe;

always @(posedge clk_sys) begin

	rx_strobe <= 0;
	tx_strobe <= 0;

	if(mode) begin

		if(io_we & ~old_we) begin
			if (port_cs) spi_ss <= din[0];                          // SPI enable
			if (port_io) tx_strobe <= 1'b1;                         // SPI write
		end

		// SPI read
		if(io_rd & ~old_rd & port_io) rx_strobe <= 1;

	end else begin
		spi_ss     <= 1;
	end
end

// DivMMC memory handling
wire      page0 = addr[15:13] == 3'b000;
wire      page1 = addr[15:13] == 3'b001;

assign    rom_active = (nRFSH & page0 & (conmem | (!mapram & automap)));
assign    ram_active = (nRFSH & page0 & !conmem & mapram & automap) | (page1 & (conmem | automap));
assign    ram_bank   = page0 ? 4'h3 : sram_page;

reg [3:0] sram_page;
reg       conmem;
reg       mapram;
reg       automap;

always @(posedge clk_sys) begin
	reg m1_trigger;

	if(mode == 2'b11) begin

		if(io_we & ~old_we) begin
			case(addr[7:0])
				'hE3: {conmem, mapram, sram_page} <= {din[7:6], din[3:0]}; // divmmc memctl
				default:;
			endcase
		end

		if(m1 & ~old_m1) begin
			casex(addr)
				16'h0000, 16'h0008, 16'h0038, 16'h0066:
					m1_trigger <= 1;                  // activate automapper after this cycle
				16'h04C6, 16'h0562:
					m1_trigger <= !disable_pagein;    // disable tape traps when the built-in tape player is in use 
				16'h3DXX:
					{automap, m1_trigger} <= 2'b11;   // activate automapper immediately
				16'b0001111111111XXX:               // 1FF8...1FFF
					m1_trigger <= 0;                  // deactivate automapper after this cycle
				default: ;
			endcase
		end
		if(~nRFSH) automap <= m1_trigger;

	end else begin
		m1_trigger <= 0;
		automap    <= 0;
		conmem     <= 0;
		sram_page  <= 0;
		mapram     <= 0;
	end
end

// SPI
spi_divmmc spi
(
   .clk_sys(clk_sys),
   .tx(tx_strobe),
   .rx(rx_strobe),
   .din(din),
   .dout(dout),
   .ready(ready),

   .spi_ce(spi_ce),
   .spi_clk(spi_clk),
   .spi_di(spi_di),
   .spi_do(spi_do)
);

endmodule

// SPI module
module spi_divmmc
(
	input        clk_sys,
	output       ready,

	input        tx,        // Byte ready to be transmitted
	input        rx,        // request to read one byte
	input  [7:0] din,
	output [7:0] dout,

	input        spi_ce,
	output       spi_clk,
	input        spi_di,
	output       spi_do
);

assign    ready   = counter[4];
assign    spi_clk = counter[0];
assign    spi_do  = io_byte[7]; // data is shifted up during transfer
assign    dout    = data;

reg [4:0] counter = 5'b10000;  // tx/rx counter is idle
reg [7:0] io_byte, data;

always @(posedge clk_sys) begin
	if(counter[4]) begin
		if(rx | tx) begin
			counter <= 0;
			data    <= io_byte;
			io_byte <= tx ? din : 8'hff;
		end
	end
	else if (spi_ce) begin
		if(spi_clk) io_byte <= { io_byte[6:0], spi_di };
		counter <= counter + 2'd1;
	end
end

endmodule
