// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module StageMem(
    input clk, rst,
    input wbEnIn, memREnIn, memWEnIn,
    input [31:0] aluResIn, valRm,
    input [3:0] destIn,

    output wbEnOut, memREnOut,
    output [31:0] aluResOut, memOut,
    output [3:0] destOut

);
    assign memREnOut = memREnIn;
    assign aluResOut = aluResIn;
    assign destOut = destIn;
    assign wbEnOut = wbEnIn;


     DataMemory mem(
         .clk(clk),
         .rst(rst),
         .memAdr(aluResIn),
         .writeData(valRm),
         .memRead(memREnIn),
         .memWrite(memWEnIn),
         .readData(memOut)
     );

endmodule
