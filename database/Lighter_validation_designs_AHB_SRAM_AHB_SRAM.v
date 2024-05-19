// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

`timescale              1ns/1ps
`default_nettype        none

/*
	Copyright 2020 Mohamed Shalan

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










































































































































































module AHB_SRAM #( parameter AW = 12) // Address width
 (
    input                   HCLK,
    input                   HRESETn,
    
    
    input wire          HSEL,
    input wire [31:0]   HADDR,
    input wire [1:0]    HTRANS,
    input wire          HWRITE,
    input wire          HREADY,
    input wire [31:0]   HWDATA,
    input wire [2:0]    HSIZE,
    output wire         HREADYOUT,
    output wire [31:0]  HRDATA,
  
    input  wire [31:0]      SRAMRDATA,          // SRAM Read Data
    output wire [3:0]       SRAMWEN,            // SRAM write enable (active high)
    output wire [31:0]      SRAMWDATA,          // SRAM write data
    output wire             SRAMCS,             // SRAM Chip Select (active high)
    output wire [AW-3:0]    SRAMADDR            // SRAM address
);   

    reg  [(AW-3):0]          buf_addr;          // Write address buffer
    reg  [ 3:0]              buf_we;            // Write enable buffer (data phase)
    reg                      buf_hit;           // High when reading a wrote-pending data
    reg  [31:0]              buf_data;          // AHB write bus buffered
    reg                      buf_pend;          // Buffer write data valid
    reg                      buf_data_en;       // Data buffer write enable (data phase)

    wire ahb_wr  = HTRANS[1] & HSEL & HREADY & HWRITE;
    wire ahb_rd  = HTRANS[1] & HSEL & HREADY & ~HWRITE;

    /*
        SRAM read involves address and data phases which matches that of an AHB 
        transactions. However, SRAM write requires both data and address to be present 
        concurrently. This causes an issue for a read operation after a write operation.
        The solution is to delay the write to be done after the read and provide a mean
        to short circuit the data if you read from the location to be written.
    */

    // Stored write data in pending state if new transfer is read
    //   buf_data_en indicate new write (data phase)
    //   ahb_rd    indicate new read  (address phase)
    //   buf_pend    is registered version of buf_pend_nxt
    wire buf_pend_nxt = (buf_pend | buf_data_en) & ahb_rd;

    always @(posedge HCLK or negedge HRESETn)
        if (~HRESETn)
        buf_pend <= 1'b0;
        else
        buf_pend <= buf_pend_nxt;

    // RAM write happens when
    // - write pending (buf_pend), or
    // - new AHB write seen (buf_data_en) at data phase,
    // - and not reading (address phase)
    wire ram_write   = (buf_pend | buf_data_en)  & (~ahb_rd);

    // RAM WE is the buffered WE
    assign SRAMWEN   = {4{ram_write}} & buf_we[3:0];

    // RAM address is the buffered address for RAM write otherwise HADDR
    assign SRAMADDR  = ahb_rd ? HADDR[AW-1:2] : buf_addr;

    // RAM chip select during read or write
    assign SRAMCS    = ahb_rd | ram_write;

    // ----------------------------------------------------------
    // Byte lane decoder and next state logic
    // ----------------------------------------------------------
    wire is_byte     = (HSIZE == 3'b000);
    wire is_half     = (HSIZE == 3'b001);
    wire is_word     = (HSIZE == 3'b010);

    wire byte_0      = is_byte & (HADDR[1:0] == 2'b00);
    wire byte_1      = is_byte & (HADDR[1:0] == 2'b01);
    wire byte_2      = is_byte & (HADDR[1:0] == 2'b10);
    wire byte_3      = is_byte & (HADDR[1:0] == 2'b11);

    wire half_0      = is_half & ~HADDR[1];
    wire half_2      = is_half & HADDR[1];

    wire byte_we_0   = is_word | half_0 | byte_0;
    wire byte_we_1   = is_word | half_0 | byte_1;
    wire byte_we_2   = is_word | half_2 | byte_2;
    wire byte_we_3   = is_word | half_2 | byte_3;

    // Address phase byte lane strobe
    wire [3:0] buf_we_nxt = {4{ahb_wr}} & {byte_we_3, byte_we_2, byte_we_1, byte_we_0};

    // buf_we keep the valid status of each byte (data phase)
    always @(posedge HCLK or negedge HRESETn)
        if (~HRESETn)
        buf_we <= 4'b0000;
        else if(ahb_wr)
        buf_we <= buf_we_nxt;

    // buf_data_en is data phase write control
    always @(posedge HCLK or negedge HRESETn)
        if (~HRESETn)
        buf_data_en <= 1'b0;
        else
        buf_data_en <= ahb_wr;

    always @(posedge HCLK) begin
        if(buf_data_en) begin
            if(buf_we[3]) buf_data[31:24] <= HWDATA[31:24];
            if(buf_we[2]) buf_data[23:16] <= HWDATA[23:16];
            if(buf_we[1]) buf_data[15: 8] <= HWDATA[15: 8];
            if(buf_we[0]) buf_data[ 7: 0] <= HWDATA[ 7: 0];
        end
    end

    always @(posedge HCLK or negedge HRESETn) begin
        if (~HRESETn)
            buf_addr <= {(AW-2){1'b0}};
        else if (ahb_wr)
            buf_addr <= HADDR[(AW-1):2];
    end

    // Do we have a matching Address (hit)?
    wire  buf_hit_nxt = (HADDR[AW-1:2] == buf_addr[AW-3 - 0:0]);
    always @(posedge HCLK or negedge HRESETn)
        if (~HRESETn)
            buf_hit <= 1'b0;
        else if(ahb_rd)
            buf_hit <= buf_hit_nxt;

    /*
        Handle the short circuit scenario, a read from a location 
        which has a write-pending operation. In this case return
        the pending data
    */
    wire [ 3:0] short  = {4{buf_hit}} & buf_we; 
    assign  HRDATA = { 
                short[3] ? buf_data[31:24] : SRAMRDATA[31:24],
                short[2] ? buf_data[23:16] : SRAMRDATA[23:16],
                short[1] ? buf_data[15: 8] : SRAMRDATA[15: 8],
                short[0] ? buf_data[ 7: 0] : SRAMRDATA[ 7: 0] 
            };

    /* 
        SRAMWDATA comes from the pending write data if any; otherwise it 
        comes from HWDATA
    */
    assign SRAMWDATA = (buf_pend) ? buf_data : HWDATA[31:0];

    // No Delay cycles; always ready
    assign HREADYOUT = 1'b1;

endmodule