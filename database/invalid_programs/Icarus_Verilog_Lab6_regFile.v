`ifndef REGFILE
`define REGFILE
`include "reg_32bit.v"      //q,d,clk,reset
`include "mux_4to1.v"       //regData,q0,q1,q2,q3,regNo
`include "decoder_2to4.v"   //register, regNo

    module regFile(
        input clk,
        input reset,
        input [1:0] readReg1,
        input [1:0] readReg2,
        input [31:0] writeData,
        input regWrite,
        input  [1:0] writeReg,
        output [31:0] readData1,
        output [31:0] readData2);
		
        genvar j;

        wire [3:0][31:0] regOut;
        reg [31:0] regIn;
        wire [3:0] decoderOut;
        wire [3:0] regClk;

        assign regClk[0] = (clk & regWrite & decoderOut[0]);
        assign regClk[1] = (clk & regWrite & decoderOut[1]);
        assign regClk[2] = (clk & regWrite & decoderOut[2]);
        assign regClk[3] = (clk & regWrite & decoderOut[3]);

        reg_32bit r0( regOut[0], regIn, regClk[0], reset );
        reg_32bit r1( regOut[1], regIn, regClk[1], reset );
        reg_32bit r2( regOut[2], regIn, regClk[2], reset );
        reg_32bit r3( regOut[3], regIn, regClk[3], reset );

        mux_4to1 m1( readData1, regOut[0] , regOut[1] , regOut[2], regOut[3], readReg1 );
        mux_4to1 m2( readData2, regOut[0] , regOut[1] , regOut[2] , regOut[3], readReg2 );
        decoder_2to4 dec1( decoderOut, writeReg );        

    endmodule
`endif