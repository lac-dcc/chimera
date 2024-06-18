// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps

module ImmProcess(ExtOp, LuiOp, Immediate, ImmExtOut, ImmExtShift); 
    //Input Control Signals
    input ExtOp; //'0'-zero extension, '1'-signed extension
    input LuiOp; //for lui instruction
    //Input
    input [15:0] Immediate;
    //Output
    output [31:0] ImmExtOut;
    output [31:0] ImmExtShift;

    wire [31:0] ImmExt;
    
    assign ImmExt = {ExtOp? {16{Immediate[15]}}: 16'h0000, Immediate};
    assign ImmExtShift = ImmExt << 2;
    assign ImmExtOut = LuiOp? {Immediate, 16'h0000}: ImmExt;

endmodule
