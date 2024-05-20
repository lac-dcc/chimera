// This program was cloned from: https://github.com/Obijuan/ACC
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
//-- ACC0 (Apollo CPU Core 0)
//--  FPGA, mediante lenguaje Verilog
//-----------------------------------------------------------------------------
//-- (C) August 2016. Juan Gonzaelz-Gomez (Obijuan)
//-- Released under the GPL license
//-----------------------------------------------------------------------------
`default_nettype none

module ACC0 (
    input wire clk,
    input wire next,
    input wire prev,
    output wire d0,
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4,
    output wire d5,
    output wire d6,
    output wire d7
);

//-- Rom file
parameter ROMFILE = "rom.list";

//-- Parameters for the memory
localparam AW = 12;     //-- Address bus
localparam DW = 16;     //-- Data bus

//-- Initial address
localparam BOOT_ADDR = 12'h800;

wire [DW-1: 0] rom_dout;


//-- Instantiate the ROM memory (2K)
genrom #(
        .ROMFILE(ROMFILE),
        .AW(AW-1),
        .DW(DW))
  ROM (
        .clk(clk),
        .cs(S[AW-1]),         //-- Bit A11 for the chip select
        .addr(S[AW-2:0]),     //-- Bits A10 - A0 for addressing the Rom (2K)
        .data_out(rom_dout)
      );

//-- Configure the pull-up resistors for clk and rst inputs
wire next_p;   //-- Next input with pull-up activated
wire clk_in;
wire prev_p;  //-- Prev input with pull-up activated
wire sw2;
wire sw1;

SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin (
   .PACKAGE_PIN(next),
   .D_IN_0(next_p)
);

SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin2 (
   .PACKAGE_PIN(prev),
   .D_IN_0(prev_p)
);

//-- rst_in and clk_in are the signals from the switches, with
//-- standar logic (1 pressed, 0 not presssed)
assign sw2 = ~prev_p;
assign sw1 = ~next_p;

//-- switch button debounced
wire sw1_deb;
wire sw2_deb;

debounce_pulse deb1 (
  .clk(clk),
  .sw_in(sw1),
  .sw_out(sw1_deb)
  );

debounce_pulse deb2 (
    .clk(clk),
    .sw_in(sw2),
    .sw_out(sw2_deb)
    );

assign clk_in = sw1_deb;

//-- Register S: Accessing memory
reg  [AW-1: 0] S = BOOT_ADDR;

always @(posedge clk) begin
    if (sw1_deb)
      S <= S + 1;
    else
      if (sw2_deb)
        S <= S - 1;
end

//-- Instruction register
reg [14:0] G = 15'b0;

//-- Control signal for the RI register
//-- Every 15-bit instruction is sotred here before executing
reg WG = 1;

always @(posedge clk)
  if (WG)
    G <= rom_dout[14:0];

//-- In ACC0, the 7 more significant bits of the G reg are shown in leds
assign {d6,d5,d4,d3,d2,d1,d0} = G[14:8];

//-- The LED7 is always set to 0
assign d7 = 1'b0;

endmodule

// -- Generic ROM
module genrom #(
         parameter AW = 11,   //-- Adress width
         parameter DW = 16,   //-- Data witdh
         parameter ROMFILE = "rom.list")  //-- Romfile
       (
         input wire clk,                  //-- Clock
         input cs,                        //-- Chip select
         input wire [AW-1: 0] addr,       //-- Address bus
         output reg [DW-1: 0] data_out);  //-- Data bus

 //-- Total position of the address
 localparam NPOS = 2 ** AW;

  //-- Memory
  reg [DW-1: 0] rom [0: NPOS-1];

  always @(negedge clk) begin
    if (cs)
      data_out <= rom[addr];
  end

//-- ROM2: Secuencia
initial begin
  $readmemh(ROMFILE, rom);
end

endmodule

module debounce_pulse(input wire clk,
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

endmodule  // debouncer_pulse


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
