// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

// Instructions
`define Load 0
`define Store 1
`define Add 2
`define Bz 3

// Commands
`define Reset 0
`define LoadCode 1
`define LoadData 2
`define Run 3

// Keep I/O fixed for TinyTapeout
module user_module_341193419111006803(
  input [7:0] io_in,
  output [7:0] io_out
);

   // State
   reg [1:0]   code[7:0];
   reg [3:0]   data[7:0];
   reg [2:0]   pc;
   reg [3:0]   acc;

   wire [2:0]  npc = pc + 1;

   assign io_out = {1'd0, pc, acc};
   wire [3:0]  cmdarg = io_in[7:4];
   wire [3:0]  arg = data[pc];

   always @(posedge io_in[0])
      case (io_in[2:1])
        `Reset: begin
           $display("        Reset");
           pc <= cmdarg[2:0];
           acc <= 0;
        end
        `LoadCode: begin
           $display("        LoadCode %d: Insn %d", pc, cmdarg);
           code[pc] <= cmdarg;
           pc <= npc;
        end
        `LoadData: begin
           $display("        LoadData %d: Data %d", pc, cmdarg);
           data[pc] <= cmdarg;
           pc <= npc;
        end
        `Run: begin
           $display("        Running %d (insn %d, %d)", pc, code[pc], data[pc]);
           case (code[pc])
             `Load: begin acc <= arg; pc = npc; end
             `Store: begin data[arg[2:0]] <= acc; pc <= npc; end
             `Add: begin acc <= acc + arg; pc <= npc; end
             `Bz: begin pc <= acc == 0 ? arg : npc; end
           endcase
           end
      endcase
endmodule

`ifdef TB
module tb;
   reg clock = 1;
   always #5 clock = !clock;

   //reg [7:0] io_in;
   reg [1:0] cmd;
   reg [3:0] cmdarg;

   wire [7:0] io_out;
   wire [7:0] io_in = {cmdarg, 1'b0, cmd, clock};
   user_module_341193419111006803 pdp0001(io_in, io_out);

   initial begin
      $monitor("%05d  pc %d acc %d", $time, pdp0001.pc, pdp0001.acc);
      cmd = `Reset; cmdarg = 0;
      @(negedge clock)
      cmd = `LoadCode;

      cmdarg = `Load; @(negedge clock)
      cmdarg = `Store; @(negedge clock)

      cmdarg = `Add; @(negedge clock)
      cmdarg = `Store; @(negedge clock)

      cmdarg = `Load; @(negedge clock)
      cmdarg = `Store; @(negedge clock)

      cmdarg = `Add; @(negedge clock)
      cmdarg = `Bz; @(negedge clock)

      cmd = `LoadData;

      cmdarg = 1; @(negedge clock)
      cmdarg = 4; @(negedge clock)

      cmdarg = 1; @(negedge clock)
      cmdarg = 0; @(negedge clock)

      cmdarg = 9; @(negedge clock)
      cmdarg = 2; @(negedge clock)

      cmdarg = 8; @(negedge clock)
      cmdarg = 7; @(negedge clock)

      cmd = `Reset; cmdarg = 0;

      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;
      @(negedge clock) cmd = `Run;

      #100 $display("The End");
      $finish;
   end
endmodule
`endif
