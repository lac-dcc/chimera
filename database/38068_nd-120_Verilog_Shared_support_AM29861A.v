// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Component : AM29861A                                                     **
 **                                                                          **
 ** 10 Bit Bus Tranceivers                                                   **
 ** https://datasheetspdf.com/datasheet/AM29861.html                         **
 *****************************************************************************/
module AM29861A(
    input OER_n,     // Output Enable Receiver, active low
    input OET_n,     // Output Enable Transmitter, active low
    inout [9:0] R,   // Receiver Data Bus
    inout [9:0] T    // Transmitter Data Bus
);
   
   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_receive;
   wire s_transmit;
   
   // Internal signals to hold the bus values
   wire [9:0] bus_R;
   wire [9:0] bus_T;
   
   
   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/


   assign s_receive = !OER_n & OET_n;
   assign s_transmit = OER_n & !OET_n;


   // TODO: This may need to be changed to avoid inout-pins
   // Tri-state logic for bidirectional bus
   // Transmitter driving
   assign bus_T  = s_transmit ? R : 10'b0;
   assign bus_R  = s_receive ? T : 10'b0;

    // Connect internal signals to inout ports
    assign T = bus_T;
    assign R = bus_R;

endmodule