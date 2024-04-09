`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: qihao
// Create Date: 03/09/2019 09:03:05 PM
// Design Name: 
// Module Name: DataExt 
// Target Devices: 
// Tool Versions: 
// Description: 
//////////////////////////////////////////////////////////////////////////////////

`include "Parameters.v"   
module DataExt(
    input wire [31:0] IN,
    input wire [1:0] LoadedBytesSelect,
    input wire [2:0] RegWriteW,
    output reg [31:0] OUT
    );
    wire [31:0] LB_IN;
    wire [31:0] LH_IN;
    assign LB_IN = (IN >> (LoadedBytesSelect * 32'h08)) & 32'h000000ff;
    assign LH_IN = (IN >> (LoadedBytesSelect * 32'h08)) & 32'h0000ffff;
    always @(*)
    begin
        case(RegWriteW)
            `LB:	OUT<={{24{LB_IN[7]}},LB_IN[7:0]};
            `LH:    OUT<={{16{LH_IN[15]}},LH_IN[15:0]};
            `LW:    OUT<=IN;
            `LBU:   OUT<={24'b0,LB_IN[7:0]};
            `LHU:   OUT<={16'b0,LH_IN[15:0]};
            default:OUT = 32'hxxxxxxxx;
        endcase
    end
    
endmodule
