// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* <-- atrac17 -->
* https://coinopcollection.org
* https://twitter.com/_atrac17
* https://github.com/atrac17
*
* Copyright (c) 2022 atrac17
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module snowbro2_sound (
    input                CLK,
    input                CLK96,
    input                RESET,
    input                RESET96,
    input                YM2151_CEN,
    input                YM2151_CEN2,
    input                OKI_CEN,

    output               PCM_CS,
    input                PCM_OK,
    output        [19:0] PCM_ADDR,
    input          [7:0] PCM_DOUT,
    output signed [15:0] left,
    output signed [15:0] right,
    output               sample,
    output reg           peak,

    input                YM2151_CS,
    input                OKI_CS,
    input                YM2151_WE,
    input                YM2151_WR_CMD,
    input                OKI_WE,
    input          [7:0] OKI_DIN,
    input          [7:0] YM2151_DIN,
    output         [7:0] YM2151_DOUT,
    output         [7:0] OKI_DOUT,

    input                OKI_BANK,
    input          [7:0] GAME,
    input          [1:0] FX_LEVEL,
    input          [1:0] FM_LEVEL,
    input                PSG_EN,
    input                FM_EN,
    input                DIP_PAUSE
);

localparam SNOWBRO2 = 'h2;
wire signed [15:0] fm_left;
wire signed [15:0] fm_right;
wire peak_l;
wire peak_r;

wire signed [13:0] oki0_pre;
wire oki0_sample;

wire [17:0] oki0_pcm_addr;

//debugging 
wire debug = 1'b1;
integer fd;

`ifdef SIMULATION
 initial fd = $fopen("logsound.txt", "w");
`endif

reg [7:0] fmgain;
reg [7:0] pcmgain;

//4.4 fixed point format
always @(posedge CLK96, posedge RESET96) begin
    if (RESET96) begin
        pcmgain<=0;
        fmgain<=0;
    end else begin
    case( FX_LEVEL )
        0: pcmgain <= 8'h18; // 150%
        1: pcmgain <= 8'h1C; // 175%
        2: pcmgain <= 8'h10; // 100% - Default
        3: pcmgain <= 8'h14; // 125%
    endcase

    case( FM_LEVEL )
        0: fmgain <= 8'h0c; // 75%
        1: fmgain <= 8'h10; // 100%
        2: fmgain <= 8'h04; // 25% - Default
        3: fmgain <= 8'h08; // 50%
    endcase
    end
end

always @(posedge CLK96) begin
    peak <= peak_l | peak_r;
end

reg [7:0] gain1;
reg signed [15:0] final_left;
reg signed [15:0] final_right;
reg signed [13:0] final_oki0;

always @(posedge CLK96) begin
    final_left<=fm_left;
    final_right<=fm_right;
    final_oki0<=oki0_pre;
end

assign right = left;
assign peak_r = peak_l;

jtframe_mixer #(.W0(16), .W1(14), .W2(16), .WOUT(16)) u_mix_left(
    .rst    ( RESET96                  ),
    .clk    ( CLK96                    ),
    .cen    ( 1'b1                     ),
    // input signals
    .ch0    ( final_left               ),
    .ch1    ( final_oki0               ),
    .ch2    ( final_right              ),
    .ch3    ( 16'd0                    ),
    // gain for each channel in 4.4 fixed point format
    .gain0  ( FM_EN ? fmgain : 16'd0   ),
    .gain1  ( PSG_EN ? pcmgain : 16'd0 ),
    .gain2  ( FM_EN ? fmgain : 16'd0   ),
    .gain3  ( 8'd0                     ),
    .mixed  ( left                     ),
    .peak   ( peak_l                   )
);

assign PCM_ADDR = GAME == SNOWBRO2 ? { OKI_BANK , oki0_pcm_addr[17:0] } : oki0_pcm_addr[17:0];

assign PCM_CS = 1'b1;

jt6295 #(.INTERPOL(1), .SAMPLE(0)) u_adpcm_0(
    .rst        ( RESET96             ),
    .clk        ( CLK96               ),
    .cen        ( OKI_CEN & DIP_PAUSE ),
    .ss         ( 1'b1                ),
    // CPU interface
    .wrn        ( OKI_WE              ), // active low
    .din        ( OKI_DIN             ),
    .dout       ( OKI_DOUT            ),
    // ROM interface
    .rom_addr   ( oki0_pcm_addr       ),
    .rom_data   ( PCM_DOUT            ),
    .rom_ok     ( PCM_OK              ),
    // Sound output
    .sound      ( oki0_pre            ),
    .sample     ( oki0_sample         )  // ~26kHz
);

jt51 u_jt51(
    .rst        ( RESET96                 ), // reset
    .clk        ( CLK96                   ), // main clock
    .cen        ( YM2151_CEN & DIP_PAUSE  ), // 3.375mhz
    .cen_p1     ( YM2151_CEN2 & DIP_PAUSE ), // 1.6875mhz, half clock
    .cs_n       ( !YM2151_CS              ), // chip select
    .wr_n       ( YM2151_WE               ), // write
    .a0         ( YM2151_WR_CMD           ),
    .din        ( YM2151_DIN              ), // data in
    .dout       ( YM2151_DOUT             ), // data out
    .ct1        (                         ),
    .ct2        (                         ),
    .irq_n      (                         ), // I do not synchronize this signal
    // Low resolution output (same as real chip)
    .sample     ( sample                  ), // marks new output sample
    .left       (                         ),
    .right      (                         ),
    // Full resolution output
    .xleft      ( fm_left                 ),
    .xright     ( fm_right                )
);

endmodule
