// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Controller (input clk, rst,
                     input start_signal,isdone,
                     output reg ready, mem_en, selA, result_signal);

  wire [2:0] Idle = 3'd0, Init = 3'd1, write = 3'd2, mul = 3'd3, Done = 3'd4;

  reg [2:0] pstate, nstate;

  always @(pstate or start_signal)
  begin
    nstate = Idle;
    case (pstate)
      Idle:
        nstate = start_signal ? Init : Idle;
      Init:
        nstate = write;
      write:
        nstate = isdone ? Done : mul;
      mul:
        nstate = write;
      Done:
        nstate = Idle;
    endcase
  end

  always @(pstate)
  begin
    {ready} = 1'd0;
    case (pstate)
      Init:
        {selA, mem_en} = 2'b11;
      write:
        {result_signal} = 1'b1;
      mul:
        {selA} = 1'b0; 
      Done:
        {ready} = 1'd1;

    endcase
  end

  always @(posedge clk or posedge rst)
  begin
    if (rst)
      pstate <= Idle;
    else
      pstate <= nstate;
  end
endmodule
