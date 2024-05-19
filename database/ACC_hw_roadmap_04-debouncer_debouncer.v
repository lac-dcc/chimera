// This program was cloned from: https://github.com/Obijuan/ACC
// License: GNU General Public License v3.0

`default_nettype none

module main (input wire clk,
             input wire sw_in,
             output wire sw_out);

//-- Configure the pull-up resistors for clk and rst inputs

wire sw_in2, sw;

SB_IO #(
    .PIN_TYPE(6'b 1010_01),
    .PULLUP(1'b 1)
) io_pin (
    .PACKAGE_PIN(sw_in),
    .D_IN_0(sw_in2)
);

//-- Sw is the signal from the switch-button, with standard logic and pull-ups
//-- activated
assign sw = ~sw_in2;

//-- Instanciate the debounce circuit
debounce d1 (
  .clk(clk),
  .sw_in(sw),
  .sw_out(sw_out)
  );

endmodule // main


module debounce(input wire clk,
                input wire sw_in,
                output wire sw_out);


//-- Debug!!!
//assign sw_out = sw_in;


//------------------------------
//-- CONTROLLER
//------------------------------

//-- fsm states
localparam STABLE_0  = 0;  //-- Idle state. Button not pressed
localparam WAIT_1 = 1;     //-- Waiting for the stabilization of 1. Butt pressed
localparam STABLE_1 = 2;   //-- Button is pressed and stable
localparam WAIT_0 = 3;     //-- Button released. Waiting for stabilization of 0

//-- Registers for storing the states
reg [1:0] state = STABLE_0;
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
    STABLE_0: begin
      timer_ena = 0;
      out = 0;
      if (sw_in)
        next_state = WAIT_1;
    end

    //-- Wait until x ms has elapsed
    WAIT_1: begin
      timer_ena = 1;
      out = 1;
      if (timer_trig)
        next_state = STABLE_1;
    end

    STABLE_1: begin
      timer_ena = 0;
      out = 1;
      if (sw_in == 0)
        next_state = WAIT_0;
    end

    WAIT_0: begin
      timer_ena = 1;
      out = 0;
      if (timer_trig)
        next_state = STABLE_0;
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
