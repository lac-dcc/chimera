// This program was cloned from: https://github.com/tioluwanimofe/cpu_verilog
// License: MIT License

module reg_file(IN, OUT1, OUT2, WRADDRESS, RD1ADDRESS, RD2ADDRESS, WRITE, CLK, RESET) ;
 //Initalizing inputs
 input [2:0] WRADDRESS, RD1ADDRESS, RD2ADDRESS;
 input WRITE, CLK, RESET;
 input [31:0] IN;
 //initializing outputs
 output [31:0] OUT1, OUT2;
 
 //initializing register variables
 integer i; 
 
 //creating the register array
 reg [31:0] regFile [7:0]; 


 //this always block runs of the positive edge of the clock and write to the register if write is ennable
 always@(posedge CLK)
 begin 
 
   if (RESET)   //resetting the registers if the reset is 1 when posedge CLK happens
   begin
     for (i = 0; i < 8; i = i + 1)
	  begin
	    regFile[i] <= 32'h00000000;
	  end
   end
   else if (WRITE) 
   begin
     regFile[WRADDRESS] <= IN; //this includes the write reg delay
   end 
 end
 
 assign OUT1 = regFile[RD1ADDRESS];
 assign OUT2 = regFile[RD2ADDRESS];
 
endmodule
