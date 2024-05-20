// This program was cloned from: https://github.com/RCoeurjoly/tt06-simplez
// License: Apache License 2.0

`default_nettype none

module tt_um_simplez_rcoeurjoly (
                                 input wire [7:0]  ui_in, // Unused: Future expansion or custom inputs
                                 output wire [7:0] uo_out, // Map to LEDs
                                 input wire [7:0]  uio_in, // Unused
                                 output wire [7:0] uio_out, // Unused
                                 output wire [7:0] uio_oe, // Unused
                                 input wire        ena, // Processor enable, not used in Simplez
                                 input wire        clk, // Clock signal
                                 input wire        rst_n     // Reset signal, active low
                                 );

   // Intermediate connection wires
   wire                                            reset_logic;
   wire [7:0]                                      leds;
   wire                                            stop_signal;
   wire                                            tx_signal;
   wire                                            rx_signal;

   // Assign Template ports to Simplez functionality
   assign reset_logic = ~rst_n; // Active low reset
   assign uo_out = leds;        // Mapping LEDs to uo_out
   assign uio_out[0] = stop_signal;  // Using a bit of uio_out for stop indicator
   assign tx_signal = uio_out[1];    // Using a bit of uio_out for TX
   assign rx_signal = ui_in[0];      // Using a bit of ui_in for RX

   // Default assignments for unused outputs
   assign uio_out[7:2] = 6'b000000;  // Unused bits
   assign uio_oe = 8'b00000000;      // No bidirectional functionality used

   // Instantiate Simplez processor with adapted connections
   simplez P0 (
               clk,
               reset_logic,  // Use intermediate wire for reset
               leds,         // Connect to LEDs directly
               stop_signal,  // Stop signal from a bit of uio_out
               tx_signal,    // Serial output to display
               rx_signal     // Serial input from keyboard
               );

endmodule
