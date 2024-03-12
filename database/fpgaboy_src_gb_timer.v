`default_nettype none
`timescale 1ns / 1ps

module timer_controller (
  input  wire        clock,
  input  wire        reset,
  input  wire        int_ack,
  output reg         int_req,
  input  wire [15:0] A,
  input  wire [7:0]  Di,
  output wire [7:0]  Do,
  input  wire        wr_n,
  input  wire        rd_n,
  input  wire        cs
);

  ////////////////////////////////////////////////
  // Timer Registers
  // 
  // DIV - Divider Register (FF04)
  //   Increments 16384 times a second
  //
  // TIMA - Timer Counter (FF05)
  //   Increments at frequency specified by TAC
  //
  // TMA - Timer Modulo (FF06)
  //   Value to load into TIMA on overflow
  //
  // TAC - Timer Control (FF07)
  //   Bit 2: 0 <= stop, 1 <= start
  //   Bit 1-0: 00 <= 4.096 KHz
  //            01 <= 262.144 KHz
  //            10 <= 65.536 KHz
  //            11 <= 16.384 KHz
  ////////////////////////////////////////////////
  
  reg[7:0] DIV;
  reg[7:0] TIMA;
  reg[7:0] TMA;
  reg[7:0] TAC;
  
  reg[7:0] reg_out;
  
  parameter MAX_TIMER = 8'hFF;
  
  wire enable;
  wire e0, e1, e2, e3;
  
  divider #(1024) d0(reset, clock, e0);
  divider #(16) d1(reset, clock, e1);
  divider #(64) d2(reset, clock, e2);
  divider #(256) d3(reset, clock, e3);
  
  always @(posedge clock)
  begin
    if (reset)
    begin
      DIV <= 8'h0;
      TIMA <= 8'h0;
      TMA <= 8'h0;
      TAC <= 8'h0;
      int_req <= 1'b0;
      reg_out <= 8'h0;
    end
    else
    begin
    
      // Read / Write for registers
      if (cs)
      begin
        if (!wr_n)
        begin
          case (A)
            16'hFF04: DIV <= 8'h0;
            16'hFF05: TIMA <= Di;
            16'hFF06: TMA <= Di;
            16'hFF07: TAC <= Di;
          endcase
        end
        else if (!rd_n)
        begin
          case (A)
            16'hFF04: reg_out <= DIV;
            16'hFF05: reg_out <= TIMA;
            16'hFF06: reg_out <= TMA;
            16'hFF07: reg_out <= TAC;
          endcase
        end
      end
      
      // Clear overflow interrupt
      if (int_ack)
        int_req <= 1'b0;
      
      // Increment timers
      if (enable)
      begin
        if (TIMA == MAX_TIMER)
          int_req <= 1'b1;
        TIMA <= (TIMA == MAX_TIMER) ? TMA : TIMA + 1'b1;
      end
      
      if (e3)
      begin
        DIV <= DIV + 1'b1;
      end
      
    end
  end
  
  assign Do = (cs) ? reg_out : 8'hZZ;
  assign enable =
    (TAC[2] == 0) ? 1'b0 :
    (TAC[1:0] == 0) ? e0 :
    (TAC[1:0] == 1) ? e1 :
    (TAC[1:0] == 2) ? e2 :
    (TAC[1:0] == 3) ? e3 : 1'b0;

endmodule
