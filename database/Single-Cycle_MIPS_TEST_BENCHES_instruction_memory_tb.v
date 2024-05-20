// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module INSTRUCTION_MEMORY_TB;

    parameter DATA_WIDTH = 32;
    parameter ADD_WIDTH = 32;
    parameter DEPTH = 128;

    reg [DATA_WIDTH - 1 : 0] pc_in;
    wire [ADD_WIDTH - 1 : 0] ins_out;

    INSTRUCTION_MEMORY dut(.pc_in(pc_in), .ins_out(ins_out));


  initial begin

    pc_in = 32'h0;
    #10;
    $display("Input PC: %h, Out Instruction: %h", pc_in, ins_out);

    pc_in = 32'h4;
    #10;
    $display("Input PC: %h, Out Instruction: %h", pc_in, ins_out);
    
    pc_in = 32'h10;
    #10;
    $display("Input PC: %h, Out Instruction: %h", pc_in, ins_out);
    
    $finish;

  end

endmodule