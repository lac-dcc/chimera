// This program was cloned from: https://github.com/Obijuan/ACC
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
//-- ACC1 (Apollo CPU Core 1)
//-----------------------------------------------------------------------------
//-- (C) August 2016. Juan Gonzaelz-Gomez (Obijuan)
//-- Released under the GPL license
//-----------------------------------------------------------------------------
//-- ACC1 is the ACC0 with the following features:
//--
//--  * Control Unit that can execute the instructions: TCF and NOOP
//--  * It has 2 modes of execution: manual or automatic
//--  * In automatic mode the instructions are executed one after another
//--       without pressing any button
//--  * In manual mode, the instructions are execute one by one, by pressing
//--       the sw1 button
//--  * The Time in automtic mode can be configure by verilog parameters
//--  * The current mode is shown in the LED7 (1: manual, 0 automatic)
//-----------------------------------------------------------------------------
`default_nettype none

//------------------------------------------------------------
//--  TOP MODULE
//------------------------------------------------------------
module ACC1 (
    input wire clk,       //-- System clock
    input wire next,      //-- Process next instruction/data
    input wire selmode,   //-- Toggle Mode: Manual / automatic

    output wire d0,       //-- Output leds
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4,
    output wire d5,
    output wire d6,
    output wire d7
);

//--------------------------------------------
//-- CONSTANTS
//--------------------------------------------
//-- Constants for the modes: automatic/manual
localparam MANUAL_MODE = 1'b1;
localparam AUTOMATIC_MODE = 1'b0;

//-- Constant for the speed of automatic mode (Number of bits for the timmer)
localparam SLOW = 24;    //--  1.4 secs
localparam MEDIUM = 22;  //--  350 ms
localparam FAST = 20;    //--  90 ms

//-- AGC Opcodes
localparam  TCF = 3'b001;  //-- Transfer Control Fixed. Unconditional jump

//-------------------------------------------------
//-- PARAMETERS & CONFIGURATION
//-------------------------------------------------

//-- Rom file
parameter ROMFILE = "rom.list";

//-- Parameters for the memory
localparam AW = 12;     //-- Address bus
localparam DW = 16;     //-- Data bus

//-- Initial address
localparam BOOT_ADDR = 12'h800;

//-- Initial G-reg value (shown in leds initially)
localparam G_INIT = 15'hAA00;

//-- Default mode configuration (Uncomment one of the options)
//localparam DEFAULT_MODE = AUTOMATIC_MODE;
localparam DEFAULT_MODE = MANUAL_MODE;

//-- Configuration for the timer of the automatic mode
//-- Uncomment one of the options
//localparam AUTOMATIC_MODE_SPEED = SLOW;
localparam AUTOMATIC_MODE_SPEED = MEDIUM;
//localparam  AUTOMATIC_MODE_SPEED = FAST;

//----------------------------------------------------------
//-- ROM MEMORY
//----------------------------------------------------------

//-- ROM output data
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

//-----------------------------------------------------------
//-- INPUT BUTTONS CONFIGURATION
//-----------------------------------------------------------

//-- Configure the pull-up resistors for clk and rst inputs
wire next_p;   //-- Next input with pull-up activated
wire selmode_p; //-- Selmode button with pull-up activated
wire sw1;
wire sw2;

//-- Button 1 pull-up
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin (
   .PACKAGE_PIN(next),
   .D_IN_0(next_p)
);

//-- Button 2 pull-up
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin2 (
   .PACKAGE_PIN(selmode),
   .D_IN_0(selmode_p)
);

//-- Buttons with positive logic: (1 pressed, 0 not presssed)
assign sw1 = ~next_p;
assign sw2 = ~selmode_p;

//-- switch button debounced
wire sw1_deb;
wire sw2_deb;

//-- Debouncer for button 1
debounce_pulse deb1 (
  .clk(clk),
  .sw_in(sw1),
  .sw_out(sw1_deb)
  );

//-- Debouncer for button 2
debounce_pulse deb2 (
  .clk(clk),
  .sw_in(sw2),
  .sw_out(sw2_deb)
  );

//-- This debouncer is used with the timer for generating a 1-cycle width pulse
//-- Not for debouncing
debounce_pulse deb3 (
  .clk(clk),
  .sw_in(timer_trig),
  .sw_out(timer_trig_pulse)
  );

//------------------------------------
//-- S REGISTER: Addressing memory
//------------------------------------

//-- Define de S-reg
reg  [AW-1: 0] S = BOOT_ADDR;

//-- Register with paralell load (WS) and increment (INCS)
always @(posedge clk) begin
    if (WS)
      S <= dir12;
    else
      if (INCS)
        S <= S + 1;
end

//---------------------------------------------------------
//-- G REGISTER: Store Instruction/data read from memory
//---------------------------------------------------------
//-- Define de G-reg
reg [14:0] G = G_INIT;

//-- G has different fields
wire [2:0]  opcode = G[14:12]; //-- Opcode: 3 bits
wire [11:0] dir12 = G[11:0];   //-- Dir12: 12 bits

//-- Register with parallel load (WG)
always @(posedge clk)
  if (WG)
    G <= rom_dout[14:0];

//-----------------------------------------
//-- LEDS
//-----------------------------------------

//-- The 7 more significant bits of G regs are shown in leds
assign {d6,d5,d4,d3,d2,d1,d0} = G[14:8];

//-- The LED7 is for displaying the mode (automatic/manual)
assign d7 = mode;

//------------------------------------------
//-- Timer for the automatic mode
//------------------------------------------
wire timer_trig;
wire timer_trig_pulse;

prescaler #(
  .N(AUTOMATIC_MODE_SPEED)
) timer_automatic (
  .clk_in(clk),
  .ena(1'b1),
  .clk_out(timer_trig)
);

//-------------------------------------------------
//-- Flip-flip T for toggling the mode
//-------------------------------------------------
reg mode = DEFAULT_MODE;

//-- Flip-flip T. The input is the button 2
always @(posedge clk) begin
//-- Change the mode when the SW2 is pressed
  if (sw2_deb)
    mode = ~mode;
end

//-- Mux for choosing manual/automatic event signal
wire event_trig = (mode == MANUAL_MODE) ? sw1_deb : timer_trig_pulse;

//---------------------------------------------------
//-- CONTROL UNIT
//---------------------------------------------------

//-- fsm states
localparam  FETCH = 0;
localparam  READ_OP = 1;
localparam  EXEC0 = 2;
localparam  WAIT = 3;

//-- Registers for storing the states
reg [1:0] state = WAIT;
reg [1:0] next_state;

//---------------- Control signals
reg WG = 0;    //-- Load the G register
reg INCS = 0;  //-- Increment the S register
reg WS = 0;    //-- Load the S register

//-- Transition between states
always @(posedge clk)
  state <= next_state;

//-- Control signal generation and next states
always @(*) begin

  //-- Default values
  next_state = state;      //-- Stay in the same state by default
  WG = 0;
  INCS = 0;
  WS = 0;

  case (state)

    FETCH: begin
      next_state = READ_OP;
    end

    READ_OP: begin
      WG = 1;   //-- Read the opcode into the G register
      INCS = 1; //-- Increment the S reg
      next_state = EXEC0;
    end

    EXEC0: begin

      //-- If opcode is TCF, load the register S
      if (opcode == TCF)
        WS = 1;

      next_state = WAIT;
    end

    WAIT: begin
      //-- Wait until an event is trigger (timer or sw1 pressed)
      if (event_trig)
        next_state = FETCH;
    end

    default: begin
    end

  endcase

end

endmodule


//-----------------------------------------------------------------
//-- OTHER MODULES
//-----------------------------------------------------------------

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
