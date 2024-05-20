// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_MEM_WB_REG(
    input clk,
    input[31:0] instrM,
    input regwriteM,
    input memtoregM,
    input[31:0] aluoutM, readdata,
    input[4:0] writeregM,
    output reg regwriteW,
    output reg memtoregW,
    output reg[31:0] aluoutW, readdataW,
    output reg[4:0] writeregW,
    output reg[31:0] instrW);

    always@(posedge clk) begin
        //$display("MEM to WB");
        regwriteW <= regwriteM;
        memtoregW <= memtoregM;
        aluoutW <= aluoutM;
        readdataW <= readdata;
        writeregW <= writeregM;
        instrW <= instrM;

        if(instrW!=8'hx)
            $display("Instruction %h is in WB stage", instrW);
    end
endmodule