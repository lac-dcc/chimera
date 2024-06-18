// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
* @brief Interrupt Mask Register (IMR) 8-bit register which contains 
* the interrupt request lines which are masked.
* 
* - This module is conneted to the OCW1 line to know which IR is masked.
* - Connected to the control logic with readIMR signal, if it is active, the IMW 
*   valuse are printed to the dataBuffer so the cpu read it.
* - IMR_reg is connected to the IRR module, if a bit is one, than the corresponding 
*   IR is masked and rejected.
* - dataBuffer lines are connected to the Data Buffer module.
*/
module InterruptMaskRegister(
  input wire [7:0] OCW1,    // OCW1 commands to know which bits are masked, connected to the R/D logic.
  input wire readIMR,       // To put the IMR_reg into the internal data lines, connected to the control logic.
  output wire [7:0] IMR_reg, // IMR (status) register, connected to IRR.
  output reg [7:0] dataBuffer = 8'bz // Internal data bus that is connected to the data buffer.
);

  // Combinational circuit.
  assign IMR_reg = OCW1;

  /*
   * On any readIMR change, if it became one, add the IMR_reg
   * or OCW1 on the internal data bus, otherwise add z (high impedance)
   * as if it is not connected to the lines.
   */
  always @ (readIMR) begin
    if (readIMR == 1)
      dataBuffer <= OCW1;
    else
      dataBuffer <= 8'bz;
  end

endmodule
