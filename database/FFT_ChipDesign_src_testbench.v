//**********************************************************
// Author: Qi Yixiang, copyright 2020
// e-mail: qyx123456@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: testbench
//
// Type: Sequential
//
// Purpose: test_bench of top everytime output is last clock cycle inputs' results, has been verified correct
//
// Details:
//
// Release History:
// - Version 1.0 20/03/26: Create.
// - Version 1.1 20/03/28: Create Data_Input txt file & stimuli logic.
// - Version 1.2 20/03/29: Create easy version top to verify & debug;
// - Version 1.3 20/04/21: Update display method by @VenciFreeman;
// - Version 1.4 20/04/21: Modify the clock by @VenciFreeman;
// - Version 1.5 20/05/07: Modify output format by @luotian12345.
//
// Notes:
//
//**********************************************************
`timescale 1ps/1ps

module testbench();

  reg         clk;
  reg         rst_n;
  reg  [33:0] InputData [0:47];
  reg  [5:0]  i;
  reg  [33:0] data_in;
  wire [33:0] data_out;

  initial begin
    clk = 1'b0;
    forever #4 clk = ~clk;
  end

  initial begin
    rst_n = 1'b0;
    $display("\nLoad Data\n");  
    $readmemb("../src/testfile/Data_input.txt", InputData); // Need to modify.

    #8 begin
      rst_n = 1'b1;
      for (i = 0; i < 47; i = i + 1) begin
        data_in = InputData[i];
        #8
        $display("[%d] %b_%b_%b %b_%b_%b\n", (i+13)%16, data_out[33], data_out[32:25], data_out[24:17], data_out[16], data_out[15:8], data_out[7:0]);
      end 
    end
  end

  fft fft0(.clk(clk), 
          .rst_n(rst_n), 
          .data_in(data_in), 
          .data_out(data_out)
          );

endmodule
