`default_nettype none

module main (input sysclk,
             input clk,
             input rst,
             output c0,
             output c1,
             output c2,
             output c3,
             output c4,
             output c5,
             output c6,
             output c7);

//-- Configure the pull-up resistors for clk and rst inputs

wire clk_in, clk2;
wire rst_in, rst2;
wire sw;

   SB_IO #(
       .PIN_TYPE(6'b 1010_01),
       .PULLUP(1'b 1)
   ) io_pin (
       .PACKAGE_PIN(clk),
       .D_IN_0(clk2)
   );

   SB_IO #(
       .PIN_TYPE(6'b 1010_01),
       .PULLUP(1'b 1)
   ) io_pin2 (
       .PACKAGE_PIN(rst),
       .D_IN_0(rst2)
   );

//-- rst_in and clk_in are the signals from the switches, with
//-- standar logic (1 pressed, 0 not presssed)
assign rst_in = ~rst2;
assign sw = ~clk2;

debounce d1 (
  .clk(sysclk),
  .sw_in(sw),
  .sw_out(clk_in)
  );


//-- Counter with asynchronous reset
reg [7:0] counter;

 always @(posedge clk_in or posedge rst_in) begin
   if (rst_in==1'b1)
     counter <= 7'b0;
   else
     counter <= counter + 1;
 end

 //-- Output the counter's bits
 assign c0 = counter[0];
 assign c1 = counter[1];
 assign c2 = counter[2];
 assign c3 = counter[3];
 assign c4 = counter[4];
 assign c5 = counter[5];
 assign c6 = counter[6];
 assign c7 = counter[7];

endmodule

module debounce(input wire clk,
                input wire sw_in,
                output wire sw_out);


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
