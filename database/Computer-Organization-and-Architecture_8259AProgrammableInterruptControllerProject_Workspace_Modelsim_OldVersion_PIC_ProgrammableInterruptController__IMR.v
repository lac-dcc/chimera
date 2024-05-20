// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * @file IMR.v
 * @brief Interrupt Mask Register (IMR) 8-bit register module
 * @details This module represents an 8-bit register that manages masked interrupt request lines.
 * It provides functionality to mask specific interrupts and interfaces with various components 
 * within the system.
 */

/**
 * @brief IMR module
 * @details The Interrupt Mask Register (IMR) module contains an 8-bit register responsible for 
 * storing masked interrupt request lines. It interfaces with the OCW1 line to determine masked 
 * interrupts, the writeIMR signal to update the dataBuffer for CPU access, and the IRR module 
 * through bitToMask for rejecting masked interrupts.
 */
module IMR(
  input wire [7:0] OCW1,
  input wire writeIMR,
  output wire [7:0] bitToMask,
  output reg [7:0] dataBuffer
);

  // Combinational logic to assign bitToMask directly from OCW1
  assign bitToMask = OCW1;

  // Asynchronous logic for updating dataBuffer based on writeIMR
  always @* begin
    if (writeIMR) begin
      dataBuffer = OCW1;
    end else begin
      dataBuffer = 8'bZ; // High-impedance state when writeIMR is inactive
    end
  end

endmodule
