// This program was cloned from: https://github.com/nkosinathintuli/eee4120f-prac5
// License: MIT License

// TSC simulation module

// set simulation time:
`timescale 1ns / 1ps

module ADC (
    input wire req,      // Request signal from TSC
    input wire rst,      // Reset signal for ADC
    output reg rdy,      // Ready signal to indicate completion
    output reg [11:0] dat // Data output from the array
);

// Constant array of values (16 data values)
reg [0:11] adc_data [0:15];
integer idx = 0;

initial begin
        $readmemh("adc_data.txt", adc_data);
    end 

always @(posedge req or posedge rst) begin
    if (rst) begin
        // Reset the device
        rdy <= 0;
        dat <= 8'b00000000; // Reset data output
        idx <= 0; // Reset array index
    end else if (req) begin
        // Read data from the sample array using modular arithmetic
        dat <= adc_data[idx]; 
        // Increment idx on the falling edge of req
        idx <= (idx + 1) % 16; // Increment index and Wrap around if idx exceeds 15
        // Raise RDY line
        rdy <= 1;
    end else begin
        // Lower RDY line if not processing
        rdy <= 0;
    end
end

endmodule





  // initial
  //   begin 
  //     // hard-coded ADC values stored in adc_data
  //     // it seams iVerilog doesn't want to initialize an array
  //     adc_data[ 0] = 8'h8B;
  //     adc_data[ 1] = 8'h8C;
  //     adc_data[ 2] = 8'h99;
  //     adc_data[ 3] = 8'h9B;
  //     adc_data[ 4] = 8'h93;
  //     adc_data[ 5] = 8'h82;
  //     adc_data[ 6] = 8'h97;
  //     adc_data[ 7] = 8'h90;
  //     adc_data[ 8] = 8'h9F;
  //     adc_data[ 9] = 8'hD7;
  //     adc_data[10] = 8'h8D;
  //     adc_data[11] = 8'h9C;
  //     adc_data[12] = 8'h85;
  //     adc_data[13] = 8'h8A;
  //     adc_data[14] = 8'h91;
  //     adc_data[15] = 8'h8C;
  //   end
  
  
//reg [7:0] idx = 0; // Index to access the array