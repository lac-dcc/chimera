// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

/**
 * @file InterruptMaskRegister_tb.v .
 * @brief Testbench for the Interrupt Mask Register (IMR) module.
 */
 
/**
 * @brief Testbench for the Interrupt Mask Register (IMR) module.
 * @details Simulates various scenarios to verify the functionality of the InterruptMaskRegister module.
 */
module InterruptMaskRegister_tb();
  
  // Inputs
  reg [7:0] OCW1;
  reg readIMR;
  
  // Outputs
  wire [7:0] IMR_reg;
  wire [7:0] dataBuffer;
  
  // Instantiate the InterruptMaskRegister module
  InterruptMaskRegister IMR_inst(
    .OCW1(OCW1),
    .readIMR(readIMR),
    .IMR_reg(IMR_reg),
    .dataBuffer(dataBuffer)
  );
  
  integer num_random_test_cases = 256;
  integer i;

  // Stimulus
  initial begin
    #10;
    for(i = 0; i < 256; i = i + 1) begin
      //Test all the possible values of OCW1 and the output of the module.
      //The DataLine will ne random as readIMR flag has a random value.
      OCW1 = i;
      readIMR = $urandom_range(0, 1);
      #10;
    end
    $finish; // End simulation
  end
  
endmodule