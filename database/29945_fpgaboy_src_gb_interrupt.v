// This program was cloned from: https://github.com/trun/fpgaboy
// License: MIT License

`default_nettype none
`timescale 1ns / 1ps

module interrupt_controller (
  input  wire        clock,
  input  wire        reset,
  input  wire        m1_n,
  input  wire        iorq_n,
  output wire        int_n,
  input  wire  [4:0] int_req,
  output reg   [4:0] int_ack,
  output wire  [7:0] jump_addr,
  input  wire [15:0] A,
  input  wire  [7:0] Di,
  output wire  [7:0] Do,
  input  wire        wr_n,
  input  wire        rd_n,
  input  wire        cs
);
  
  //////////////////////////////////////
  // Interrupt Registers
  //
  // IF - Interrupt Flag (FF0F)
  //   Bit 4: New Value on Selected Joypad Keyline(s) (rst 60)
  //   Bit 3: Serial I/O transfer end                 (rst 58)
  //   Bit 2: Timer Overflow                          (rst 50)
  //   Bit 1: LCD (see STAT)                          (rst 48)
  //   Bit 0: V-Blank                                 (rst 40)
  //
  // IE - Interrupt Enable (FFFF)
  //   Bit 4: New Value on Selected Joypad Keyline(s)
  //   Bit 3: Serial I/O transfer end
  //   Bit 2: Timer Overflow
  //   Bit 1: LCDC (see STAT)
  //   Bit 0: V-Blank
  //
  //   0 <= disable
  //   1 <= enable
  //////////////////////////////////////
  
  wire[7:0] IF;
  reg[7:0] IE;
  
  parameter POLL_STATE = 0;
  parameter WAIT_STATE = 1;
  parameter ACK_STATE = 2;
  parameter CLEAR_STATE = 3;
  
  parameter VBLANK_INT = 0;
  parameter LCDC_INT = 1;
  parameter TIMER_INT = 2;
  parameter SERIAL_INT = 3;
  parameter INPUT_INT = 4;
  
  parameter VBLANK_JUMP = 8'hA0; // 8'h40;
  parameter LCDC_JUMP   = 8'hA2; // 8'h48;
  parameter TIMER_JUMP  = 8'hA4; // 8'h50;
  parameter SERIAL_JUMP = 8'hA6; // 8'h58;
  parameter INPUT_JUMP  = 8'hA8; // 8'h60;
  
  reg[1:0] state;
  reg[2:0] interrupt;
  reg[7:0] reg_out;
  
  always @(posedge clock)
  begin
  
    if (reset)
    begin
      IE <= 8'h0;
      state <= POLL_STATE;
    end
    else
    begin
    
      // Read / Write for registers
      if (cs)
      begin
        if (!wr_n)
        begin
          case (A)
            16'hFFFF: IE <= Di;
          endcase
        end
        else if (!rd_n)
        begin
          case (A)
            16'hFF0F: reg_out <= IF;
            16'hFFFF: reg_out <= IE;
          endcase
        end
      end
      
      case (state)
        POLL_STATE:
        begin
          if (IF[VBLANK_INT] && IE[VBLANK_INT])
          begin
            interrupt <= VBLANK_INT;
            state <= WAIT_STATE;
          end
          else if (IF[LCDC_INT] && IE[LCDC_INT])
          begin
            interrupt <= LCDC_INT;
            state <= WAIT_STATE;
          end
          else if (IF[TIMER_INT] && IE[TIMER_INT])
          begin
            interrupt <= TIMER_INT;
            state <= WAIT_STATE;
          end
          else if (IF[SERIAL_INT] && IE[SERIAL_INT])
          begin
            interrupt <= SERIAL_INT;
            state <= WAIT_STATE;
          end
          else if (IF[INPUT_INT] && IE[INPUT_INT])
          begin
            interrupt <= INPUT_INT;
            state <= WAIT_STATE;
          end
        end
        WAIT_STATE:
        begin
          if (!m1_n && !iorq_n)
            state <= ACK_STATE;
        end
        ACK_STATE:
        begin
          int_ack[interrupt] <= 1'b1;
          state <= CLEAR_STATE;
        end
        CLEAR_STATE:
        begin
          int_ack[interrupt] <= 1'b0;
          if (m1_n || iorq_n)
            state <= POLL_STATE;
        end
      endcase
      
    end
  end
  
  assign IF = int_req; // this makes the value read only

  assign Do = (cs) ? reg_out : 8'hFF;
  assign int_n = (state == WAIT_STATE) ? 1'b0 : 1'b1; // active low
  assign jump_addr =
      (interrupt == VBLANK_INT) ? VBLANK_JUMP :
      (interrupt == LCDC_INT) ? LCDC_JUMP :
      (interrupt == TIMER_INT) ? TIMER_JUMP :
      (interrupt == SERIAL_INT) ? SERIAL_JUMP :
      (interrupt == INPUT_INT) ? INPUT_JUMP : 8'hZZ;

endmodule
