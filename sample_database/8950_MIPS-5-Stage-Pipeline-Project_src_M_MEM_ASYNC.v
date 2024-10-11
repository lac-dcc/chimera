// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_MEM_ASYNC#(
    parameter RAM_SIZE = 256
)(
    input clk,
    input[$clog2(RAM_SIZE)-1:0] address,
    output [31:0] instruction);

    reg[31:0] RAM[RAM_SIZE:0];
    initial $readmemh("meminstr.dat", RAM);  

    assign instruction = RAM[address]; // word aligned

    always@(instruction)begin
        if(instruction!=8'hx)
            $display("Fetched instruction %h", instruction);
    end
endmodule