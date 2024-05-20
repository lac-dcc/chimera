// This program was cloned from: https://github.com/efabless/EF_QSPI_XIP_CTRL
// License: Apache License 2.0

/*
	Copyright 2020 Mohamed Shalan (mshalan@aucegypt.edu)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale          1ns/1ps
`default_nettype    none

/*
    AHB-Lite Quad I/O flash XiP controller with Nx16 RO Direct-mapped Cache.
    Intended to be used to execute only from an external Quad I/O SPI Flash Memory
    
    Performance (CM0 @ 50MHz using gcc -O2)
    
         Configuration                                 run-time (msec)
    NUM_LINES   LINE_SIZE   stress          hash            chacha          xtea(256)       aes_sbox        G. Mean
    128         16          0.208 (4.9x)    0.707 (8.8x)    0.277 (7.4x)    0.212 (11.9x)   0.339 (6.4x)    7.53
    64          16          0.208 (4.9x)    0.779 (8.0x)    0.277 (7.4x)    0.212 (11.9x)   0.339 (6.4x)    7.39
    32          16          0.233 (4.4x)    0.869 (7.2x)    0.334 (6.2x)    0.212 (11.9x)   0.339 (6.4x)    6.83     <-- default
    16          16          0.410 (2.5x)    1.259 (5.0x)    0.436 (4.7x)    0.212 (11.9x)   0.339 (6.4x)    5.37    
    8           16          0.692 (1.5x)    2.217 (2.8x)    0.951 (2.2x)    0.218 (11.6x)   0.341 (6.4x)    3.69
    4           16          0.899 (1.1x)    4.983 (1.3x)    1.723 (1.2x)
    2           16          1.020 (1.0x)    6.243 (1.0x)    2.076 (1.0x)    2.527 ( 1.0x)   2.191 (1.0x)    1.00
    
    Miss time is 28 + 4*LINE_SIZE
    Line_SIZE   Miss Time   # of fetched Instr. (32/16)
    16          92          4/8
    32          156         8/16

    Software Reset Time = 2/clk x (RESET_CYCLES + 1)
*/

module EF_QSPI_XIP_CTRL_ahbl #(parameter    NUM_LINES   = 16, 
                                            LINE_SIZE   = 32, 
                                            RESET_CYCLES= 999 )
(
    // AHB-Lite Slave Interface
    input   wire                HCLK,
    input   wire                HRESETn,
    input   wire                HSEL,
    input   wire [31:0]         HADDR,
    input   wire [1:0]          HTRANS,
    input   wire                HWRITE,
    input   wire                HREADY,
    output  reg                 HREADYOUT,
    output  wire [31:0]         HRDATA,

    // External Interface to Quad I/O
    output  wire                sck,
    output  wire                ce_n,
    input   wire [3:0]          din,
    output  wire [3:0]          dout,
    output  wire [3:0]          douten     
);

    localparam [1:0]    IDLE    =   2'b00;
    localparam [1:0]    WAIT    =   2'b01;
    localparam [1:0]    RW      =   2'b10;
    localparam      OFF_WIDTH   = $clog2(LINE_SIZE);

    // Cache wires/buses
    wire [31:0]                 c_datao;
    wire [(LINE_SIZE*8)-1:0]    c_line;
    wire                        c_hit;
    reg [2:0]                   c_wr;
    wire [23:0]                 c_A;

    // Flash Reader wires
    wire                        fr_rd;
    wire                        fr_done;

    wire                        doe;
    
    reg [1:0]   state, nstate;

    //AHB-Lite Address Phase Regs
    reg             last_HSEL;
    reg [31:0]      last_HADDR;
    reg             last_HWRITE;
    reg [1:0]       last_HTRANS;
    reg             last_valid;

    wire            valid = HSEL & HTRANS[1] & HREADY;

    always@ (posedge HCLK or negedge HRESETn) 
    begin
        if(~HRESETn) begin
            last_HSEL   <= 'b0;
            last_HADDR  <= 'b0;
            last_HWRITE <= 'b0;
            last_HTRANS <= 'b0;
            last_valid  <= 'b0;
        end
        else if(HREADY) begin
            last_HSEL   <= HSEL;
            last_HADDR  <= HADDR;
            last_HWRITE <= HWRITE;
            last_HTRANS <= HTRANS;
            last_valid  <= valid;
        end
    end

    always @ (posedge HCLK or negedge HRESETn)
        if(HRESETn == 0) 
            state <= IDLE;
        else 
            state <= nstate;

    always @* begin
        nstate = IDLE;
        case(state)
            IDLE :  if(valid & c_hit) 
                            nstate = IDLE;
                        else if(valid & ~c_hit) 
                            nstate = WAIT;

            WAIT :  if(c_wr[2]) 
                            nstate = RW; 
                        else  
                            nstate = WAIT;

            RW   :   nstate = IDLE;
        endcase
    end

    always @(posedge HCLK or negedge HRESETn)
        if(!HRESETn) 
            HREADYOUT <= 1'b1;
        else
            case (state)
                IDLE :  if(valid & c_hit) 
                            HREADYOUT <= 1'b1;
                        else if(valid & ~c_hit) 
                            HREADYOUT <= 1'b0;
                        else 
                            HREADYOUT <= 1'b1;

                WAIT :  HREADYOUT <= 1'b0;

                RW   :  HREADYOUT <= 1'b1;
            endcase
        
    assign fr_rd        =   ( HTRANS[1] & HSEL & HREADY & ~c_hit & (state==IDLE) ) |
                            ( HTRANS[1] & HSEL & HREADY & ~c_hit & (state==RW) );

    assign c_A          =   (state != IDLE) ? last_HADDR[23:0] : HADDR;
    

    DMC #(  .NUM_LINES(NUM_LINES), 
            .LINE_SIZE(LINE_SIZE) ) 
    CACHE ( 
            .clk(HCLK), 
            .rst_n(HRESETn), 
            .A(c_A),
            .Do(c_datao), 
            .hit(c_hit), 
            .line(c_line), 
            .wr(c_wr[1]) 
        );

    EF_QSPI_XIP_CTRL #(     .NUM_LINES(NUM_LINES), 
                            .LINE_SIZE(LINE_SIZE), 
                            .RESET_CYCLES(RESET_CYCLES) )   
    FC (   
            .clk(HCLK), 
            .rst_n(HRESETn), 
            .addr({c_A[23:OFF_WIDTH], {OFF_WIDTH{1'b0}}}), 
            .rd(fr_rd), 
            .done(fr_done), 
            .line(c_line),
            .sck(sck), 
            .ce_n(ce_n), 
            .din(din), 
            .dout(dout), 
            .douten(doe) 
        );

    reg [31:0] cdata;
    assign HRDATA   = cdata;
    
    always @(posedge HCLK)
        case (state)
            IDLE: if(valid & c_hit) cdata <= c_datao;
            WAIT: if(c_wr[1]) cdata <= c_datao;
        endcase

    always @ (posedge HCLK or negedge HRESETn) 
        if(~HRESETn)
            c_wr <= 'b0;
        else begin
            c_wr[0] <= fr_done;
            c_wr[1] <= c_wr[0];
            c_wr[2] <= c_wr[1];
        end
  
    assign douten = {4{doe}};
    
endmodule