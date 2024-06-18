// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License

// Code your testbench here
// or browse Examples
//
`timescale 1ns/1ps


module tsense_read_tb();
  wire CS, SCK, SIO;
  reg RSTN, SYSCLK;
  wire [7:0] dbugout;
  wire [7:0] dataSeg;
  wire [1:0] disp;


  //Task for simple test
  task testRead;
    begin
        #15   RSTN = 1'b1;
    end
  endtask

  
  //Instiate LM07
  LM07 tsense(.CS(CS), .SCK(SCK), .SIO(SIO));
  //Instiate DUT
  LM07_read dut(.SYSCLK(SYSCLK), .RSTN(RSTN), .CS(CS), .SCK(SCK), .SIO(SIO), .disp(disp), .dataSeg(dataSeg), .dbugout(dbugout) );
  //LM07_read dut(.SYSCLK(SYSCLK), .RSTN(RSTN), .CS(CS), .SCK(SCK), .SIO(SIO), .disp(disp), .dataSeg(dataSeg));
 
  //Initialize CS
  initial RSTN = 1'b0;
  
  //Generate test clock
  initial SYSCLK= 1'b1;
  initial forever #10 SYSCLK = ~SYSCLK;

  //Testbench
  initial
    begin
      //$monitor("time= %0t;data[]=,CS=%b,CLK=%b,SIO=%b,",$time,CS,CLK,SIO);
          
      $dumpfile("dump.vcd");
      $dumpvars(1);
      testRead;
      #1500
      $finish(2);
    end
endmodule

//Define
`define TEMP_SET  16'h0B9F

// Verilog model for the SPI-based temperature 
// sensor LM07 or it's equivalent family.
//
module LM07(CS, SCK, SIO);
  output SIO;
  input SCK, CS;
  //
  // lm07_reg represents the register that stores
  // temperature value after A2D conversion
  // FIXME: Model the A2D
  reg [15:0] shift_reg;
  wire clk_gated;
  
  //Reset at startup
  initial begin
    shift_reg = `TEMP_SET; 
    //shift_reg = shift_reg>>1;
  end
  
  //SIO bit of the LM07 is hardwired output of
  // the MSB of the shift register
  assign SIO = shift_reg[15];
  
  //Gate the clock with CS
  assign clk_gated = ~CS & SCK;
  
  // When CS goes low, load temp_shift_reg with lm07_reg
  // If high, reset
  always @(CS)
   begin
     shift_reg = `TEMP_SET;
     //shift_reg = shift_reg>>1;
   end
  
  //Shift register to shift the loaded temp reg
  //every negedge of the gated clock
  always @(negedge clk_gated)
    begin
      shift_reg = shift_reg<<1;
    end
endmodule