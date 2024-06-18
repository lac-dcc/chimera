// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_EX_MEM_REG(
    input clk,
    input[31:0] instrE,
    input regwriteE, memtoregE, memwriteE,
    // input zero, 
    input[31:0] aluout, writedataE,
    input[4:0] writeregE,
    // input [31:0] pcbranch,
    output reg regwriteM, memtoregM, memwriteM,
    //output reg zeroM, 
    output reg [31:0] aluoutM, writedataM,
    output reg [4:0] writeregM,
    //output reg [31:0] pcbranchM,
    output reg [31:0] instrM);

    always @(posedge clk) begin
        //$display("EX to MEM");
        regwriteM <= regwriteE;
        memtoregM <= memtoregE;
        memwriteM <= memwriteE;
        //branchM <= branchE;
        //zeroM <= zero;
        aluoutM <= aluout;
        writedataM <= writedataE;
        writeregM <= writeregE;
        //pcbranchM <= pcbranch;
        instrM <= instrE;
        if(instrM!=8'hx)
            $display("Instruction %h is in MEM stage", instrM);
    end
endmodule