// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

// MIT License
// 
// Copyright (c) 2023 Sudeep et al.
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

`timescale 1ns / 1ps
`default_nettype none

module reg_file (
	input wire clk,
	input wire rst_n, // active low reset
	input wire i_re, // read enable
	input wire i_wr, // write enable
	input wire [4:0] i_rs1, // source register 1 address
	input wire [4:0] i_rs2, // source register 2 address
	input wire [4:0] i_rd, // destination register address
	input wire [31:0] i_write_data, // data to be written to destination register
	output wire [31:0] o_read_data1, // data read from source register 1
	output wire [31:0] o_read_data2 // data read from source register 2
);

//only for simulation
`ifdef SIM
integer fd;
`endif

//base register file
reg [31:0] base_reg[31:1]; //x0 is hardwired to zero

//internal signals and registers
wire is_write;

assign is_write = i_wr && rst_n && (i_rd != 0);

always @(posedge clk)
begin
    if(~rst_n)
    begin
	base_reg[1] <= 32'd0;
	base_reg[2] <= 32'd0;
	base_reg[3] <= 32'd0;
	base_reg[4] <= 32'd0;
	base_reg[5] <= 32'd0;
	base_reg[6] <= 32'd0;
	base_reg[7] <= 32'd0;
	base_reg[8] <= 32'd0;
	base_reg[9] <= 32'd0;
	base_reg[10] <= 32'd0;
	base_reg[11] <= 32'd0;
	base_reg[12] <= 32'd0;
	base_reg[13] <= 32'd0;
	base_reg[14] <= 32'd0;
	base_reg[15] <= 32'd0;
	base_reg[16] <= 32'd0;
	base_reg[17] <= 32'd0;
	base_reg[18] <= 32'd0;
	base_reg[19] <= 32'd0;
	base_reg[20] <= 32'd0;
	base_reg[21] <= 32'd0;
	base_reg[22] <= 32'd0;
	base_reg[23] <= 32'd0;
	base_reg[24] <= 32'd0;
	base_reg[25] <= 32'd0;
	base_reg[26] <= 32'd0;
	base_reg[27] <= 32'd0;
	base_reg[28] <= 32'd0;
	base_reg[29] <= 32'd0;
	base_reg[30] <= 32'd0;
	base_reg[31] <= 32'd0;
    end
    
    if(is_write)
    begin
    	base_reg[i_rd] <= i_write_data; //synchronous write
    end	
    //only for simulation
end

`ifdef SIM
always @(posedge clk)
begin
    if(is_write)
    begin
    	
	fd = $fopen("ID_log.csv","ab+");
	$fwrite(fd,"x%d:%h\n",i_rd,i_write_data);	
	$fclose(fd);
    end
    else if(rst_n)
    begin
    	
    	fd = $fopen("ID_log.csv","ab+");
	$fwrite(fd,"\t\n");	
	$fclose(fd);
    end
end
`endif 

// asynchronous read
assign o_read_data1 = ((i_rs1 == 0) | ~i_re) ? 0 : base_reg[i_rs1]; //if x0 is being read then output zero
assign o_read_data2 = ((i_rs2 == 0) | ~i_re) ? 0 : base_reg[i_rs2];

endmodule
