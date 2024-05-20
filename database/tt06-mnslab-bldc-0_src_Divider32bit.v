// This program was cloned from: https://github.com/BatuCem/tt06-mnslab-bldc-0
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: Hacettepe University MNS Labs
// Engineer: 
// 
// Create Date: 17.01.2024 11:44:23
// Design Name: BLDC
// Module Name: Divider32bit
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Divider32bit (
   input      clk,
   input      reset,
   input      start_division,
   input [31:0] dividend,    
   input [31:0] divisor,  
   output reg [31:0] quotient, 
   output reg [31:0] remainder, 
   output reg division_active,
  	output reg division_done
);

  reg [5:0] division_cycle;
   reg [32:0] store_divisor;   
   reg [32:0] shifting_divisor;    
   reg [31:0] shifting_dividend;    

   // State machine
   always @(posedge clk) begin
      if (reset) begin
         store_divisor <= 33'b0;
         shifting_divisor <= 33'b0;
         shifting_dividend <= dividend;
         division_active <= 0;
      	 division_cycle <= 6'b100001; 
       	division_done<=0;
      end
		else if (division_cycle == 6'b000000) begin
         division_active <= 0;
         quotient <= shifting_dividend;
         remainder <= shifting_divisor[32:1];
         division_done<=1;
      end
      else if (start_division && (division_cycle > 0)) begin
         shifting_divisor <= {shifting_divisor[31:0], shifting_dividend[31]};
         shifting_dividend <= {shifting_dividend[30:0], 1'b0};
         
        if (shifting_divisor >= store_divisor) begin
            store_divisor <= {1'b0, divisor};  
            shifting_divisor <= 33'b0;
            shifting_divisor[32:1] <= shifting_divisor[31:0] - store_divisor[31:0];
            shifting_divisor[0] <= shifting_dividend[31]; 
            shifting_dividend[0] <= 1;
         end
        division_cycle <= division_cycle - 1;
       	
         division_active <= 1;
      end else begin
         division_active <= 1;
      end
     
   end
endmodule
