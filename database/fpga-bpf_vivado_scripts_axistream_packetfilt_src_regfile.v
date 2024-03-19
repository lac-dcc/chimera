//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
/*

regfile.v

The BPF VM defines "scratch memory" where you can load and store values (in addition
to being able to load data from the packet itself). This is basically a fancy way of
saying a "register file", so that's what this module implements.

Note that I (intentionally) use ASYNchronous reads and SYNchronous writes. First,
this is the behaviour I wanted, and also, I have confirmed that Vivado synthesizes this
as LUT RAM.

This module is instantiated as part of bpfvm_datapath.

*/

module regfile(
    input wire clk,
    input wire rst,
    input wire [3:0] addr,
    input wire [31:0] idata,
    input wire wr_en,
    output wire [31:0] odata
);

//Scratch memory (a.k.a. register file)
reg [31:0] scratch [0:15];

//odata's value is found by selecting one of the storage registers usign a MUX
assign odata = scratch[addr];

//At clock edge, perform right write wright rite of writing to right write location
always @(posedge clk) begin
	if (rst) begin
		scratch[0] <= 0;
		scratch[1] <= 0;
		scratch[2] <= 0;
		scratch[3] <= 0;
		scratch[4] <= 0;
		scratch[5] <= 0;
		scratch[6] <= 0;
		scratch[7] <= 0;
		scratch[8] <= 0;
		scratch[9] <= 0;
		scratch[10] <= 0;
		scratch[11] <= 0;
		scratch[12] <= 0;
		scratch[13] <= 0;
		scratch[14] <= 0;
		scratch[15] <= 0;
	end else if (wr_en == 1'b1) begin
        scratch[addr] <= idata;
    end
end

endmodule
