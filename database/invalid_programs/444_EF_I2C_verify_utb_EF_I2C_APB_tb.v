// This program was cloned from: https://github.com/efabless/EF_I2C
// License: Apache License 2.0

/*
    Copyright (c) 2023 Mohamed Shalan (mshalan@aucegypt.edu)

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

`define     DUMP(name,level)            initial begin $dumpfile("``name``.vcd"); $dumpvars(level); end
`define     TIMEOUT(value)              initial begin #value $display("Timeout, exiting..."); $finish; end
`define     CLK(name, period)           reg name=0; always #(period/2) name <= !name;
`define     SRSTN(rst, clk, duration)   reg rst=1'bx; initial begin #2 rst <= 1'b0; #(duration); @(posedge clk) rst <= 1'b1; end 
`define     APBSIG                      reg PWRITE, PENABLE, PSEL; reg [31:0] PWDATA, PADDR; wire PREADY; wire [31:0] PRDATA;

module EF_I2C_APB_tb;

    `APBSIG

    `CLK(PCLK, 100)                 // 10 MHz Clock
    `SRSTN(PRESETn, PCLK, 555)

    // I2C interface
    wire        i2c_scl_i;
    wire        i2c_scl_o;
    wire        i2c_scl_t;
    wire        i2c_sda_i;
    wire        i2c_sda_o;
    wire        i2c_sda_t;

    `DUMP(EF_I2C_APB_tb, 0)
    `TIMEOUT(10_000_000)

    `include "apb_tasks.vh"

    tri1     scl_pin;
    tri1     sda_pin;

    assign  scl_pin = ~i2c_scl_o ? 1'b0 : 1'bz;
    assign  i2c_scl_i = scl_pin;
    assign  sda_pin = ~i2c_sda_o ? 1'b0 : 1'bz;
    assign  i2c_sda_i = sda_pin;
    
    EF_I2C_APB MUV (
        .PCLK(PCLK),
        .PRESETn(PRESETn),

        .PWRITE(PWRITE),
        .PWDATA(PWDATA),
        .PADDR(PADDR),
        .PENABLE(PENABLE),
        .PSEL(PSEL),
        .PREADY(PREADY),
        .PRDATA(PRDATA),

        // I2C interface
        .scl_i(i2c_scl_i),
        .scl_o(i2c_scl_o),
        .scl_oen_o(i2c_scl_t),
        .sda_i(i2c_sda_i),
        .sda_o(i2c_sda_o),
        .sda_oen_o(i2c_sda_t)
    );

    M24AA64 I2C_SLAVE (
        .A0(1'b1), 
        .A1(1'b0), 
        .A2(1'b1), 
        .WP(1'b0), 
        .SDA(sda_pin), 
        .SCL(scl_pin), 
        .RESET(~PRESETn)
    );

    // The test
    reg[31:0] data;
    initial begin
        @(posedge PRESETn);

        // i2c clock is 100KHz; 10MHz/(4x25)
        APB_W_WR(32'h0C, 32'd25);   

        // Writing something to the 24AA64 memory
        APB_W_WR(32'h04, 32'h00_00_04_55);  // Address: 0x55, write
        APB_W_WR(32'h08, 32'h00_00_00_00);  // data: 00 - Memory Address hi
        APB_W_WR(32'h04, 32'h00_00_04_55);  // Address: 0x55, write
        APB_W_WR(32'h08, 32'h00_00_00_00);  // data: 00 - Mmeory address low
        APB_W_WR(32'h04, 32'h00_00_04_55);  // Address: 0x55, write
        APB_W_WR(32'h08, 32'h00_00_00_10);  // data: 10
        APB_W_WR(32'h04, 32'h00_00_04_55);  // Address: 0x55, write
        APB_W_WR(32'h08, 32'h00_00_00_20);  // data: 20
        APB_W_WR(32'h04, 32'h00_00_04_55);  // Address: 0x55, write
        APB_W_WR(32'h08, 32'h00_00_02_30);  // data: 30, last
        APB_W_WR(32'h04, 32'h00_00_10_55);  // Address: 0x55, stop

        // Wait for the memory to finish writing (it takes 5ms according to the datasheet)
        // We could just wait for 5 msec; also, we could keep writing and checking for ACK
        
        // Wait for 6 msec
        #6_000_000;  

        // Read back the data
        // first write the address
        APB_W_WR(32'h04, 32'h00_00_04_55);  // Address: 0x55, write
        APB_W_WR(32'h08, 32'h00_00_00_00);  // data: 00 - Memory Address hi
        APB_W_WR(32'h04, 32'h00_00_04_55);  // Address: 0x55, write
        APB_W_WR(32'h08, 32'h00_00_02_00);  // data: 00 - Mmeory address low
        // then read the data
        APB_W_WR(32'h04, 32'h00_00_02_55);  // Address: 0x55, read
        APB_W_WR(32'h04, 32'h00_00_02_55);  // read
        APB_W_WR(32'h04, 32'h00_00_02_55);  // read
        
        // wait till the data is received into the fifo from the i2c bus
        #2_000_000;

        // Now read the data from the fifo
        APB_W_RD(32'h08, data);
        APB_W_RD(32'h08, data);
        APB_W_RD(32'h08, data);
        
    end

endmodule