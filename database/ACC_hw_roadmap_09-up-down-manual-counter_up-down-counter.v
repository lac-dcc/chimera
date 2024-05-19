// This program was cloned from: https://github.com/Obijuan/ACC
// License: GNU General Public License v3.0

`default_nettype none

module main (input clk,
             input sw1,
             input sw2,
             output c0,
             output c1,
             output c2,
             output c3,
             output c4,
             output c5,
             output c6,
             output c7);

//-- Configure the pull-up resistors for clk and rst inputs
wire sw1_p;  //-- up input with pull-up
wire sw2_p;
wire up;
wire down;

SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin (
   .PACKAGE_PIN(sw1),
   .D_IN_0(sw1_p)
);

SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin2 (
   .PACKAGE_PIN(sw2),
   .D_IN_0(sw2_p)
);

debounce d1 (
  .clk(clk),
  .sw_in(~sw1_p),
  .sw_out(up)
  );

debounce d2 (
  .clk(clk),
  .sw_in(~sw2_p),
  .sw_out(down)
  );

//-- Counter
reg [7:0] counter = 8'h08;

 always @(posedge clk) begin
   if (up)
     counter <= counter + 1;
   else
     if (down)
       counter <= counter - 1;
 end

 //-- Output the counter's bits
 assign {c7,c6,c5,c4,c3,c2,c1,c0} = counter;

endmodule

module debounce(input wire clk,
                input wire sw_in,
                output wire sw_out);


//------------------------------
//-- CONTROLLER
//------------------------------

//-- fsm states
localparam IDLE  = 0;    //-- Idle state. Button not pressed
localparam WAIT_1  = 1;  //-- Waiting for the stabilization of 1. Butt pressed
localparam PULSE = 2;    //-- 1-clk pulse is generated
localparam WAIT_0 = 3;   //-- Button released. Waiting for stabilization of 0

//-- Registers for storing the states
reg [1:0] state = IDLE;
reg [1:0] next_state;

//-- Control signals
reg out = 0;
reg timer_ena = 0;

assign sw_out = out;

//-- Transition between states
always @(posedge clk)
  state <= next_state;

//-- Control signal generation and next states
always @(*) begin

  //-- Default values
  next_state = state;      //-- Stay in the same state by default
  timer_ena = 0;
  out = 0;

  case (state)

    //-- Button not pressed
    //-- Remain in this state until the botton is pressed
    IDLE: begin
      timer_ena = 0;
      out = 0;
      if (sw_in)
        next_state = WAIT_1;
    end

    //-- Wait until x ms has elapsed
    WAIT_1: begin
      timer_ena = 1;
      out = 0;
      if (timer_trig)
        next_state = PULSE;
    end

    PULSE: begin
      timer_ena = 0;
      out = 1;
      next_state = WAIT_0;
    end

    WAIT_0: begin
      timer_ena = 1;
      out = 0;
      if (timer_trig && sw_in==0)
        next_state = IDLE;
    end

    default: begin

    end
  endcase
end

assign sw_out = out;

//-- Timer

wire timer_trig;


prescaler #(
  .N(16)
) pres0 (
  .clk_in(clk),
  .ena(timer_ena),
  .clk_out(timer_trig)
);

endmodule  // debounce


//-- Prescaler N bits
module prescaler(input wire clk_in,
                 input wire ena,
                 output wire clk_out);

//-- Bits of the prescaler
parameter N = 22;

//-- N bits counter
reg [N-1:0] count = 0;

//-- The most significant bit is used as output
assign clk_out = count[N-1];

always @(posedge(clk_in)) begin
  if (!ena)
    count <= 0;
  else
    count <= count + 1;
end
endmodule /// prescaler
