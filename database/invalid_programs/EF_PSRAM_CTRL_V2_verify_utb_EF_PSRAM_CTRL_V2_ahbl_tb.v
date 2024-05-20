// This program was cloned from: https://github.com/efabless/EF_PSRAM_CTRL_V2
// License: Apache License 2.0

/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
	
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

`timescale              1ns/1ps

module EF_PSRAM_CTRL_V2_ahbl_tb;
    wire[3:0]       dio;
    reg            HCLK = 0;
    reg            HRESETn = 0;
    reg            HSEL = 1;
    reg [31:0]     HADDR;
    reg [31:0]     HWDATA;
    reg [1:0]      HTRANS = 0;
    reg            HWRITE = 0;
    reg [2:0]      HSIZE;
    wire           HREADY;
    wire           HREADYOUT;
    wire [31:0]    HRDATA;
    
    wire            sck;
    wire            ce_n;
    wire [3:0]      din;
    wire [3:0]      dout;
    wire [3:0]      douten;    

    `include "AHB_tasks.vh"

    EF_PSRAM_CTRL_V2_ahbl psram_ctrl(
        // AHB-Lite Slave Interface
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HSEL(HSEL),
        .HADDR(HADDR),
        .HWDATA(HWDATA),
        .HTRANS(HTRANS),
        .HSIZE(HSIZE),
        .HWRITE(HWRITE),
        .HREADY(HREADY),
        .HREADYOUT(HREADYOUT),
        .HRDATA(HRDATA),
        .sck(sck),
        .ce_n(ce_n),
        .din(din),
        .dout(dout),
        .douten(douten)     
    );

    assign dio[0] = douten[0] ? dout[0] : 1'bz;
    assign dio[1] = douten[1] ? dout[1] : 1'bz;
    assign dio[2] = douten[2] ? dout[2] : 1'bz;
    assign dio[3] = douten[3] ? dout[3] : douten[0] ? 1'b1 : 1'bz;     // Pull-up if not driven to avoid SRAM hold

    assign din = dio;

    M23LC1024 SRAM (
        .SI_SIO0(dio[0]), 
        .SO_SIO1(dio[1]), 
        .SCK(sck), 
        .CS_N(ce_n), 
        .SIO2(dio[2]), 
        .HOLD_N_SIO3(dio[3]), 
        .RESET(~HRESETn)
    );

    initial begin
        $dumpfile("EF_PSRAM_CTRL_ahbl_tb.vcd");
        $dumpvars;
        #999;
        @(posedge HCLK)
            HRESETn <= 1;
        #100_000 $finish;
    end

    always #25 HCLK = ~HCLK;
    
    reg [31:0] data;
    initial begin
        @(posedge HRESETn);
        #999;
        // Out of reset the controller is in SPI mode
        $display("TB: Write and read a word in SPI mode");
        AHB_WRITE_WORD(32'h0000_0000, 32'h59AA13F3);
        AHB_READ_WORD(32'h0000_0000, data);
        #1;
        $display("wrote %X and read %X : %s", 32'h59AA13F3, data, (data==32'h59AA13F3)?"passed":"failed");

        $display("TB: Write bytes and read a word in SPI mode");
        AHB_WRITE_BYTE(32'h0000_1000, 8'h55);
        AHB_WRITE_BYTE(32'h0000_1001, 8'h33);
        AHB_WRITE_BYTE(32'h0000_1002, 8'h77);
        AHB_WRITE_BYTE(32'h0000_1003, 8'h7E);
        AHB_READ_WORD(32'h0000_1000, data);
        #1;
        $display("wrote %X and read %X : %s", 32'h7e773355, data, (data==32'h7e773355)?"passed":"failed");

        // Switch to QPI then perform a write then a read
        $display("Switching to the QPI mode");
        AHB_WRITE_WORD(32'h0080_0400, 8'h38);   // set the EQPI command
        AHB_WRITE_WORD(32'h0080_0800, 8'hFF);   // set the XQPI command
        AHB_WRITE_WORD(32'h0080_1000, 8'h02);   // set the wait states
        AHB_WRITE_WORD(32'h0080_4000, 8'h01);   // Initiate EQPI process
        AHB_WRITE_WORD(32'h0000_0000, 8'h00);   // Issue EQPI
        AHB_WRITE_WORD(32'h0080_4000, 8'h00);   // Stop EQPI process
        #300;                                   // wait
        AHB_WRITE_WORD(32'h0080_2000, 8'h02);   // Switch teh controller to the QPI mode
        
        // Write some word and read it back
        AHB_WRITE_WORD(32'h0059_ABCD, 32'h59BB14E7);
        AHB_READ_WORD(32'h0059_ABCD, data);
        #1;
        $display("wrote %X and read %X : %s", 32'h59BB14E7, data, (data==32'h59BB14E7)?"passed":"failed");        

        #100;
        $finish;
    end

    assign HREADY = HREADYOUT;


endmodule