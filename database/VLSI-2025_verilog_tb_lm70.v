// This program was cloned from: https://github.com/silicon-vlsi/VLSI-2025
// License: MIT License

////////////////////////////////////////////////////////////////////////////
// Verilog model for the SPI-based temperature 
// sensor LM70 or it's equivalent family.
//
module LM70(TEMP_SET, RSTN, CS, SCK, SIO);
  output SIO;
  input SCK, CS, RSTN;
  input [15:0] TEMP_SET;
  //
  // lm07_reg represents the register that stores
  // temperature value after A2D conversion
  // FIXME: Model the A2D
  reg [15:0] shift_reg;
  wire clk_gated;
  
  //Reset at startup
  //initial begin
  //  shift_reg = TEMP_SET; 
    //shift_reg = shift_reg>>1;
  //end
  
  //SIO bit of the LM07 is hardwired output of
  // the MSB of the shift register
  assign SIO = shift_reg[15];

  //Gate the clock with CS
  assign clk_gated = ~CS & SCK;
  
  // When CS goes low, load temp_shift_reg with lm07_reg
  // If high, reset
  always @(negedge CS or negedge RSTN)
    begin  
      shift_reg <= TEMP_SET;
    end
  
  //Shift register to shift the loaded temp reg
  //every negedge of the gated clock
  always @(negedge clk_gated)
    begin
      shift_reg = shift_reg<<1;
    end
  /*initial begin
    $monitor("data=%0b,dataseg=%0b,dataout=%0b",SIO,dataSeg,dbugout);
  end*/
endmodule
//////////////////////////////////////////////////////////////////////////////////
    
