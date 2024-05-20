// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//******************************************************************

//******************************************************************
`timescale 1ns/1ns
module i2s_loop
#(
    parameter DATA_WIDTH = 8
)
(
    input                       sck,
    input                       rst_n,

    output reg [DATA_WIDTH - 1:0]  ldata,
    output reg [DATA_WIDTH - 1:0]  rdata,

    input   [DATA_WIDTH - 1:0]  data,
    input                       r_vld,
    input                       l_vld
);

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        ldata <= {DATA_WIDTH{1'b0}};
    else if(l_vld)
        ldata <= data;
end

always @(posedge sck or negedge rst_n)
begin
    if(~rst_n)
        rdata <= {DATA_WIDTH{1'b0}};
    else if(r_vld)
        rdata <= data;
end

endmodule //i2s_loop
