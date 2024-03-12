//=============================================================================================
// LED Pixel Drivers
// Copyright 2014 by Glen Akins.
// All rights reserved.
// 
// Set editor width to 96 and tab stop to 4.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//=============================================================================================

module pixels01
(
	input	wire			rst_n,				// actie-low async reset (tied to PB0)
	input	wire			clk50_in,			// 50MHz clock in

	input	wire			gpmc_clk,			// gpmc bus
	input	wire			gpmc_csn,
	input	wire			gpmc_advn,
	input	wire			gpmc_oen,
	input	wire			gpmc_wen,
	input	wire	[1:0]	gpmc_ben,
	inout	wire	[15:0]	gpmc_ad,

	input	wire			pushbutton,			// user interface (tied to PB1)
	input	wire	[1:0]	switch,
	output	wire	[1:0]	led,

	output	wire		 	PMOD1_1_LVDS8_P,
	output	wire			PMOD1_2_LVDS8_N,
	output	wire			PMOD1_3_LVDS7_P,
	output	wire			PMOD1_4_LVDS7_N,
	output	wire			PMOD1_7_LVDS1_P,
	output	wire			PMOD1_8_LVDS1_N,
	output	wire			PMOD1_9_LVDS2_P,
	output	wire			PMOD1_10_LVDS2_N,

	output	wire			PMOD2_1_LVDS6_P,
	output	wire			PMOD2_2_LVDS6_N,
	output	wire			PMOD2_3_LVDS5_P,
	output	wire			PMOD2_4_LVDS5_N,
	output	wire			PMOD2_7_LVDS3_P,
	output	wire			PMOD2_8_LVDS3_N,
	output	wire			PMOD2_9_LVDS4_P,
	output	wire			PMOD2_10_LVDS4_N
);

// reset wires and assignments
wire rst;
assign rst = ~rst_n;

wire ws2812b_txd_0, ws2812b_txd_1, ws2812b_txd_2, ws2812b_txd_3;
wire ws2811_txd_0, ws2811_txd_1, ws2811_txd_2, ws2811_txd_3;
wire dmx_txd_0, dmx_txd_1, dmx_txd_2, dmx_txd_3;

// pmod 1 connection assignments
assign PMOD1_1_LVDS8_P  = ws2812b_txd_0;		// top half of pmod 1
assign PMOD1_2_LVDS8_N  = dmx_txd_0;
assign PMOD1_3_LVDS7_P  = ws2811_txd_0;
assign PMOD1_4_LVDS7_N  = 0;
assign PMOD1_7_LVDS1_P  = 0;					// bottom half of pmod 1
assign PMOD1_8_LVDS1_N  = 0;
assign PMOD1_9_LVDS2_P  = 0;
assign PMOD1_10_LVDS2_N = 0;

// pmod 2 connection assignments
assign PMOD2_1_LVDS6_P  = 0;					// top half of pmod 2
assign PMOD2_2_LVDS6_N  = 0;
assign PMOD2_3_LVDS5_P  = 0;
assign PMOD2_4_LVDS5_N  = 0;
assign PMOD2_7_LVDS3_P  = 0;					// bottom half of pmod 2
assign PMOD2_8_LVDS3_N  = 0;
assign PMOD2_9_LVDS4_P  = 0;
assign PMOD2_10_LVDS4_N = 0;


//---------------------------------------------------------------------------------------------
// clock generator
//

wire clk100, clk50, clk20, clk10;

clkgen clkgen
(
	.CLK_IN1			(clk50_in),
	.CLK_OUT1			(clk100),
	.CLK_OUT2			(clk50),
	.CLK_OUT3			(clk20),
	.CLK_OUT4			(clk10)
);


//---------------------------------------------------------------------------------------------
// blink the LEDs
//

reg [23:0] counter50;

always @ (posedge clk50 or negedge rst_n)
begin
	if (!rst_n)
	begin
		counter50 <= 0;
	end
	else
	begin
		counter50 <= counter50 + 1;
	end
end

assign led[0] = counter50[23];


reg [23:0] counter20;

always @ (posedge clk20 or negedge rst_n)
begin
	if (!rst_n)
	begin
		counter20 <= 0;
	end
	else
	begin
		counter20 <= counter20 + 1;
	end
end

assign led[1] = counter20[23];


//---------------------------------------------------------------------------------------------
// gpmc bus interface
//

wire sb_rd, sb_wr;
wire [16:1] sb_addr;
wire [15:0] sb_wr_data;
reg [15:0] sb_rd_data;

gpmc_target gpmc_target
(
    .rst_n              (rst_n),
    .clk                (clk100),

    .gpmc_clk           (gpmc_clk),
    .gpmc_csn           (gpmc_csn),
    .gpmc_advn          (gpmc_advn),
    .gpmc_oen           (gpmc_oen),
    .gpmc_wen           (gpmc_wen),
    .gpmc_ben           (gpmc_ben),
    .gpmc_ad            (gpmc_ad),

    .sb_wr              (sb_wr),
    .sb_rd              (sb_rd),
    .sb_addr            (sb_addr),
    .sb_wr_data         (sb_wr_data),
    .sb_rd_data         (sb_rd_data)
);


//---------------------------------------------------------------------------------------------
// gpmc test registers
//

reg [15:0] reg0, reg1, reg2, reg3;

always @ (posedge clk100 or negedge rst_n)
begin
	if (!rst_n)
	begin
		reg0 <= 0;
		reg1 <= 0;
		reg2 <= 0;
		reg3 <= 0;
		
		sb_rd_data <= 16'hffff;
	end
	else
	begin
        if (sb_wr)
        begin
            case (sb_addr)
                0: reg0 <= sb_wr_data;
                1: reg1 <= sb_wr_data;
                2: reg2 <= sb_wr_data;
                3: reg3 <= sb_wr_data;
				// 4: read-only
				// 5: read-only
				// 6: read-only
				// 7: read-only
            endcase
        end

        if (sb_rd)
        begin
            case (sb_addr)
                0: sb_rd_data <= reg0;
                1: sb_rd_data <= reg1;
                2: sb_rd_data <= reg2;
                3: sb_rd_data <= reg3;
				4: sb_rd_data <= 16'hdead;
				5: sb_rd_data <= 16'hbeef;
				6: sb_rd_data <= 16'hcafe;
				7: sb_rd_data <= 16'hfeed;
            endcase
        end
	end
end


//---------------------------------------------------------------------------------------------
// WS2812b/WS2811 transmitters
//

reg		[12:0] 	ws_addr;				// { strip[2:0], bank[0], pixel[7:0], word[0] }
reg		[7:0] 	ws_wr;
reg		[8:0] 	ws_wr_addr;				// { bank[0], pixel[7:0] }
reg		[23:0] 	ws_wr_data;

reg		[2:0]	ws_strip;
reg				ws_bank;
reg		[8:0]	ws_lights;
reg				ws_start_tgl;
reg				ws_start_tgl_z;
reg				ws_start_tgl_zz;
reg				ws_start_tgl_zzz;
reg		[7:0]	ws_start;

always @ (posedge clk100 or negedge rst_n)
begin
    if (!rst_n)
    begin
		ws_addr <= 0;
		ws_wr <= 0;
		ws_wr_addr <= 0;
		ws_wr_data <= 0;
		ws_strip <= 0;
		ws_bank <= 0;
		ws_lights <= 0;
		ws_start_tgl <= 0;
	end
	else
	begin
		// defaults
		ws_wr <= 0;

		if (sb_wr)
		begin
			case (sb_addr)
				
				// 0x0010 ws2812b pointer register
				8: begin
					ws_addr <= sb_wr_data[12:0];
				end

				// 0x0012 write 24 bit word to memory at ws_addr[9:1]
				9: begin
					ws_addr <= ws_addr + 1;
					ws_wr[7] <= ws_addr[0] && (ws_addr[12:10] == 3'b111);
					ws_wr[6] <= ws_addr[0] && (ws_addr[12:10] == 3'b110);
					ws_wr[5] <= ws_addr[0] && (ws_addr[12:10] == 3'b101);
					ws_wr[4] <= ws_addr[0] && (ws_addr[12:10] == 3'b100);
					ws_wr[3] <= ws_addr[0] && (ws_addr[12:10] == 3'b011);
					ws_wr[2] <= ws_addr[0] && (ws_addr[12:10] == 3'b010);
					ws_wr[1] <= ws_addr[0] && (ws_addr[12:10] == 3'b001);
					ws_wr[0] <= ws_addr[0] && (ws_addr[12:10] == 3'b000);
					ws_wr_addr <= ws_addr[9:1];
					if (!ws_addr[0]) ws_wr_data[23:16] <= sb_wr_data[7:0];
					if (ws_addr[0]) ws_wr_data[15:0] <= sb_wr_data;
				end

				// 0x0014 select number of lights and start transmission
				10: begin
					ws_strip <= sb_wr_data[12:10];
					ws_bank <= sb_wr_data[9];
					ws_lights <= sb_wr_data[8:0];
				end

			endcase

			if (sb_addr == 10) 
			begin
                ws_start_tgl <= ~ws_start_tgl;
			end
		end
	end
end

always @ (posedge clk20 or negedge rst_n)
begin
    if (!rst_n)
    begin
        ws_start_tgl_z <= 0;
        ws_start_tgl_zz <= 0;
        ws_start_tgl_zzz <= 0;
        ws_start <= 0;
    end
    else
    begin
        ws_start_tgl_z <= ws_start_tgl;
        ws_start_tgl_zz <= ws_start_tgl_z;
        ws_start_tgl_zzz <= ws_start_tgl_zz;

        ws_start[7] <= (ws_strip == 7) && (ws_start_tgl_zzz != ws_start_tgl_zz);
        ws_start[6] <= (ws_strip == 6) && (ws_start_tgl_zzz != ws_start_tgl_zz);
        ws_start[5] <= (ws_strip == 5) && (ws_start_tgl_zzz != ws_start_tgl_zz);
        ws_start[4] <= (ws_strip == 4) && (ws_start_tgl_zzz != ws_start_tgl_zz);
        ws_start[3] <= (ws_strip == 3) && (ws_start_tgl_zzz != ws_start_tgl_zz);
        ws_start[2] <= (ws_strip == 2) && (ws_start_tgl_zzz != ws_start_tgl_zz);
        ws_start[1] <= (ws_strip == 1) && (ws_start_tgl_zzz != ws_start_tgl_zz);
        ws_start[0] <= (ws_strip == 0) && (ws_start_tgl_zzz != ws_start_tgl_zz);
    end
end


//---------------------------------------------------------------------------------------------
// WS2811 Drivers
//

ws2811 ws2811_3
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[7]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[7]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2811_txd_3)
);

ws2811 ws2811_2
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[6]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[6]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2811_txd_2)
);

ws2811 ws2811_1
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[5]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[5]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2811_txd_1)
);

ws2811 ws2811_0
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[4]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[4]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2811_txd_0)
);


//---------------------------------------------------------------------------------------------
// WS2812b Drivers
//

ws2812b ws2812b_3
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[3]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[3]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2812b_txd_3)
);

ws2812b ws2812b_2
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[2]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[2]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2812b_txd_2)
);

ws2812b ws2812b_1
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[1]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[1]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2812b_txd_1)
);

ws2812b ws2812b_0
(
    .rst_n                  (rst_n),
    .clk                    (clk20),

	.wr_clk					(clk100),
    .wr						(ws_wr[0]),
    .wr_addr				(ws_wr_addr),
    .wr_data				(ws_wr_data),

    .start					(ws_start[0]),
    .bank					(ws_bank),
    .leds					(ws_lights),

    .tx_out              	(ws2812b_txd_0)
);


//---------------------------------------------------------------------------------------------
// DMX 512 transmitters
//

dmx dmx0
(
	.rst_n					(rst_n),
	.clk					(clk20),
	.dmx_txd				(dmx_txd_0),
	.dmx_tx_fifo_clk		(clk100),
	.dmx_tx_fifo_full		(),
	.dmx_tx_fifo_wr			(sb_wr && (sb_addr == 12)),
	.dmx_tx_fifo_wr_data	(sb_wr_data[8:0])
);

dmx dmx1
(
	.rst_n					(rst_n),
	.clk					(clk20),
	.dmx_txd				(dmx_txd_1),
	.dmx_tx_fifo_clk		(clk100),
	.dmx_tx_fifo_full		(),
	.dmx_tx_fifo_wr			(sb_wr && (sb_addr == 13)),
	.dmx_tx_fifo_wr_data	(sb_wr_data[8:0])
);

dmx dmx2
(
	.rst_n					(rst_n),
	.clk					(clk20),
	.dmx_txd				(dmx_txd_2),
	.dmx_tx_fifo_clk		(clk100),
	.dmx_tx_fifo_full		(),
	.dmx_tx_fifo_wr			(sb_wr && (sb_addr == 14)),
	.dmx_tx_fifo_wr_data	(sb_wr_data[8:0])
);

dmx dmx3
(
	.rst_n					(rst_n),
	.clk					(clk20),
	.dmx_txd				(dmx_txd_3),
	.dmx_tx_fifo_clk		(clk100),
	.dmx_tx_fifo_full		(),
	.dmx_tx_fifo_wr			(sb_wr && (sb_addr == 15)),
	.dmx_tx_fifo_wr_data	(sb_wr_data[8:0])
);


endmodule
