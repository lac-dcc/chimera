// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module start_up_rom (
    input clk,
    input rst,
    input [31:0] instruction_address,
    output reg [31:0] instruction_data,
    output done
  );
  
  reg doneness = 0;
  assign done = doneness;
  
  always@(*) begin
    case(instruction_address)
      32'h00: instruction_data <= 32'h40000113; // stack addi x2, x0, 1024
      32'h04: instruction_data <= 32'h00000413; // fp addi x8, x0, 0
      32'h08: instruction_data <= 32'h00000093; // ra addi x1, x0, 0
      // start files
      32'h0c: instruction_data <= 32'h000102b3; // load end of stack add t0, sp, x0
      32'h10: instruction_data <= 32'h00000313; // load 0 addi t1, x0, 0
      32'h14: instruction_data <= 32'h00000393; // load 0 for addressing addi t2, x0 ,0
      32'h18: instruction_data <= 32'h0003a023; // store sw x0, 0(t2)
      32'h1c: instruction_data <= 32'h00130313; // add1 t1 t1 1
      32'h20: instruction_data <= 32'h00438393; // addi t2, t2 4 align 4
      32'h24: instruction_data <= 32'hfe53cae3; // blt t2, t0, -12
      32'h28: instruction_data <= 32'h00000013; // load first instruction address addi a0, x0, 0
      32'h2c: begin
        instruction_data <= 32'h000000e7; // jump jalr ra 0(x0)
        doneness <= 1;
      end

      default: begin
        doneness <= 1;
      end
    endcase
  end
endmodule
