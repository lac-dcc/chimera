// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

// Keep I/O fixed for TinyTapeout
module user_module_341360223723717202(
  input wire[7:0] io_in, 
  output wire[7:0] io_out
);
  // using io_in[0] as clk, io_in[1] as reset
  wire clk;
  assign clk = io_in[0];
  wire reset;
  assign reset = io_in[1];
  wire[5:0] mem_in;
  assign mem_in = io_in[7:2];

  reg[5:0] reg_a;
  reg[5:0] reg_b;
  reg[5:0] reg_c;
  reg[5:0] pc;
  reg[5:0] instr;
  reg[5:0] mem_request;
  reg[1:0] micro_pc;
  reg ctrl_output_a;

  assign io_out = ctrl_output_a ? { 2'b10, reg_a }
                                : { 4'b0000, mem_request };

  always @(posedge clk) begin
    if (reset) begin
      reg_a <= 1;
      reg_b <= 1;
      reg_c <= 0;
      pc <= 0;
      micro_pc <= 0;
      instr <= 0;
      mem_request <= 0;
      ctrl_output_a <= 0;
    end else begin
      micro_pc <= micro_pc + 1;
      if (micro_pc == 0) begin
        mem_request <= pc;
        pc <= pc + 1;
      end else if (micro_pc == 1) begin
        instr <= mem_in;
      end else if (micro_pc == 2) begin
        if (instr == 1) reg_a <= reg_a + reg_b;
        else if (instr == 2) begin reg_a <= reg_b; reg_b <= reg_a; end
        else if (instr == 3) begin reg_a <= reg_c; end
        else if (instr == 4) begin reg_c <= reg_a; end
        else if (instr == 5 || instr == 6 || instr == 7) begin mem_request <= pc; end
        else if (instr == 8) begin reg_a <= reg_a + 1; end
        else if (instr == 9) begin reg_a <= ~reg_a; end
        else if (instr == 16) begin ctrl_output_a <= 1; end
      end else if (micro_pc == 3) begin
        if (instr == 5) begin pc <= mem_in; end
        else if (instr == 6) begin
          if (reg_a != 0) begin pc <= mem_in; end else begin pc <= pc + 1; end
        end
        else if (instr == 7) begin reg_a <= mem_in; pc <= pc + 1; end
        else if (instr == 16) begin ctrl_output_a <= 0; end
      end
    end
  end

endmodule
