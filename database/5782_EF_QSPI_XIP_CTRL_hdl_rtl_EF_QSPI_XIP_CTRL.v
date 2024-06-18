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
    RTL Model for reading from Quad I/O flash using the QUAD I/O FAST READ (0xEB) 
    command with the continuous read option enabled. The Quad I/O bit must be set 
    during flash programming. The provided flash memory model has the bit set.

    Every transaction reads one cache line from the flash. To start a transaction, 
    provide the memory address and assert rd for 1 clock cycle. done is a sserted 
    for 1 clock cycle when the data is ready

*/
module FLASH_READER_QSPI #(parameter LINE_SIZE   = 16)(
    input   wire                        clk,
    input   wire                        rst_n,
    input   wire [23:0]                 addr,
    input   wire                        rd,
    output  wire                        done,
    output  wire [(LINE_SIZE*8)-1: 0]   line,      

    output  reg                         sck,
    output  reg                         ce_n,
    input   wire [3:0]                  din,
    output  wire [3:0]                  dout,
    output  wire                        douten
);
    localparam LINE_BYTES = LINE_SIZE;
    localparam LINE_CYCLES = LINE_BYTES * 8;

    localparam  IDLE =  1'b0, 
                READ =  1'b1;

    reg         state, nstate;
    reg [7:0]   counter;
    reg [23:0]  saddr;
    reg [7:0]   data [LINE_BYTES-1 : 0]; 

    reg         first;

    wire[7:0]   EBH = 8'heb;
    
    // for debugging
    wire [7:0] data_0 = data[0];
    wire [7:0] data_1 = data[1];
    wire [7:0] data_15 = data[15];

    always @*
        case (state)
            IDLE:   if(rd) 
                        nstate = READ; 
                    else 
                        nstate = IDLE;
            READ:   if(done) 
                        nstate = IDLE; 
                    else 
                        nstate = READ;
        endcase 

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) first <= 1'b1;
        else if(first & done) first <= 0;

    
    always @ (posedge clk or negedge rst_n)
        if(!rst_n) state <= IDLE;
        else state <= nstate;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) sck <= 1'b0;
        else if(~ce_n) sck <= ~ sck;
        else if(state == IDLE) sck <= 1'b0;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) ce_n <= 1'b1;
        else if(state == READ) ce_n <= 1'b0;
        else ce_n <= 1'b1;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) counter <= 8'b0;
        else if(sck & ~done) counter <= counter + 1'b1;
        else if(state == IDLE) 
            if(first) counter <= 8'b0;
            else counter <= 8'd8;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) saddr <= 24'b0;
        else if((state == IDLE) && rd) saddr <= addr;

    always @ (posedge clk)
        if(counter >= 20 && counter <= 19+LINE_BYTES*2)
            if(sck) 
                data[counter/2 - 10] <= {data[counter/2 - 10][3:0], din}; // Optimize!

    assign dout     =   (counter < 8)   ?   {3'b0, EBH[7 - counter]}    :
                        (counter == 8)  ?   saddr[23:20]                : 
                        (counter == 9)  ?   saddr[19:16]                :
                        (counter == 10) ?   saddr[15:12]                :
                        (counter == 11) ?   saddr[11:8]                 :
                        (counter == 12) ?   saddr[7:4]                  :
                        (counter == 13) ?   saddr[3:0]                  :
                        (counter == 14) ?   4'hA                        :
                        (counter == 15) ?   4'h5                        : 
                                            4'h0;    
        
    assign douten   = (counter < 20);

    assign done     = (counter == 19+LINE_BYTES*2);


    generate
        genvar i; 
        for(i=0; i<LINE_BYTES; i=i+1)
            assign line[i*8+7: i*8] = data[i];
    endgenerate

endmodule

/*
    Software reset to exit the EBh command ccontinuous read in case of a non-PoR.
    RESET_CYCLES has to change to refelct the max clock frequency of the system
    Here we assume 50MHz for a reset time of 40usec
*/
module FLASH_RESET #(parameter RESET_CYCLES=1023) (
    input   wire            clk,
    input   wire            rst_n,
    input   wire            start,
    output  wire            done,

    output  wire            sck,
    output  wire            ce_n,
    input   wire [3:0]      din,
    output  wire [3:0]      dout,
    output  wire            douten
);

    wire[7:0]   C66 = 8'h66;
    wire[7:0]   C99 = 8'h99;

    reg[11:0]   counter;
    reg         ck;

    reg         idle;

    always @(posedge clk or negedge rst_n)
        if(!rst_n)  
            idle <= 1'b1;
        else if(start)   
            idle <= 1'b0;
    

    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            ck <= 1'b0;
        else
            if(counter < RESET_CYCLES)
                ck <= ~ck;

    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            counter <= 5'b0;
        else 
            if((idle == 1'b0) && (counter < RESET_CYCLES) && (ck == 1'b1))
                counter <= counter + 1;

    assign  ce_n    =   (counter > 10'd0 && counter < 10'd9)  ?   1'b0 :
                        (counter > 10'd11 && counter < 10'd20)?   1'b0 :    
                        1'b1;

    wire    d_o     =   (counter > 10'd0  && counter < 10'd9)  ?   C66[counter-1] :
                        (counter > 10'd11 && counter < 10'd20) ?   C99[counter-12] :
                        1'b0;

    assign  dout    =   {3'b0, d_o};
                    
    assign  done    =   (counter == RESET_CYCLES);

    assign  douten  =   1'b1;

    assign  sck     =   ck & ~ce_n;
    //((counter > 5'd1 && counter < 5'd10));

endmodule

/*
    A QSPI XIP Flash controller  
*/
module EF_QSPI_XIP_CTRL #( parameter    NUM_LINES   = 16, 
                                        LINE_SIZE   = 16,
                                        RESET_CYCLES= 1023 ) 
(
    input   wire                        clk,
    input   wire                        rst_n,
    input   wire [23:0]                 addr,
    input   wire                        rd,
    output  wire                        done,
    output  wire [(LINE_SIZE*8)-1: 0]   line,      

    output  wire                        sck,
    output  wire                        ce_n,
    input   wire [3:0]                  din,
    output  wire [3:0]                  dout,
    output  wire                        douten
);

    reg         first;
    reg         d_first;


    reg         rd_rd_;
    wire        rd_done;
    wire        rst_done;

    wire        rd_sck;
    wire        rd_ce_n;
    wire [3:0]  rd_din;
    wire [3:0]  rd_dout;
    wire        rd_douten;

    wire        rst_sck;
    wire        rst_ce_n;
    wire [3:0]  rst_din;
    wire [3:0]  rst_dout;
    wire        rst_douten;

    assign      done    = rd_done;

    assign      sck     = first ? rst_sck       :   rd_sck;
    assign      ce_n    = first ? rst_ce_n      :   rd_ce_n;
    assign      dout    = first ? rst_dout      :   rd_dout;
    assign      douten  = first ? rst_douten    :   rd_douten;
    
    assign      rd_din  = din;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) 
            rd_rd_ <= 1'b0;
        else if(rst_done) 
            rd_rd_ <= 1'b1;
        else if(rd_rd_) 
            rd_rd_ <= 1'b0; 

    wire    rd_rd = d_first ? rd_rd_ : rd;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) 
            first <= 1'b1;
        else if(rst_done) 
            first <= 1'b0;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) 
            d_first <= 1'b1;
        else 
            d_first <= first;

    FLASH_READER_QSPI #(.LINE_SIZE(LINE_SIZE)) 
    READER (
        .clk(clk),
        .rst_n(rst_n),
        .addr(addr),
        .rd(rd_rd),
        .done(rd_done),
        .line(line),
        .sck(rd_sck), 
        .ce_n(rd_ce_n), 
        .din(rd_din), 
        .dout(rd_dout), 
        .douten(rd_douten)  
    );

    FLASH_RESET #(.RESET_CYCLES(RESET_CYCLES))
    RESET (
        .clk(clk),
        .rst_n(rst_n),
        .start(rd),
        .done(rst_done),
        .sck(rst_sck), 
        .ce_n(rst_ce_n), 
        .din(rst_din), 
        .dout(rst_dout), 
        .douten(rst_douten)  
    );

endmodule