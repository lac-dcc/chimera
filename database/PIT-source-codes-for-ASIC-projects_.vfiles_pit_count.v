// This program was cloned from: https://github.com/3b3al-MV/PIT-source-codes-for-ASIC-projects
// License: MIT License


module pit_count #(parameter COUNT_SIZE = 16)
  (
  output reg [COUNT_SIZE-1:0] cnt_n,         // Modulo Counter value
  output reg                  cnt_flag_o,    // Counter Rollover Flag
  output reg                  pit_o,         // PIT output pulse
  input                       async_rst_b,   //
  input                       sync_reset,    // Syncronous reset signal
  input                       bus_clk,       // Reference Clock
  input                       counter_sync,  // Syncronous counter enable
  input                       prescale_out,  // Increment Counter
  input                       pit_flg_clr,   // Clear PIT Rollover Flag
  input      [COUNT_SIZE-1:0] mod_value      // Count Divisor
  );

// Warning: This counter has no safety net if the mod_value changes while the counter
//           is active. There may need to be an additional latch register for
//           "mod_value" that captures the falling edge of "counter_sync" or
//           when "cnt_n" rolls over to eliminate this problem.


wire rollover;      // Counter has reached the mod_value
wire no_div;        // Modulo set for Zero or One
wire clear_counter; // Set counter to initial state

assign no_div = (mod_value == 1) || ~|mod_value;

assign rollover = ((cnt_n == mod_value) || no_div) && prescale_out;

assign clear_counter = !counter_sync;

//  Div N Counter
always @(posedge bus_clk or negedge async_rst_b)
  if ( !async_rst_b )
    cnt_n  <= 1;
  else if ( clear_counter || rollover || no_div)
    cnt_n  <= 1;
  else if ( prescale_out )
    cnt_n  <= cnt_n + 1;

//  Counter Rollover Flag and Interrupt
always @(posedge bus_clk or negedge async_rst_b)
  if ( !async_rst_b )
    cnt_flag_o <= 0;
  else if ( clear_counter || pit_flg_clr)
    cnt_flag_o <= 0;
  else if ( rollover )
    cnt_flag_o <= 1;

//  PIT Output Register
always @(posedge bus_clk or negedge async_rst_b)
  if ( !async_rst_b )
    pit_o <= 0;
  else
    pit_o <= rollover && counter_sync && !sync_reset;

endmodule  // pit_count

