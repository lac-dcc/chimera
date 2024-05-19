// This program was cloned from: https://github.com/racerxdl/LVDS-7-to-1-Serializer
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:43 07/04/2013 
// Design Name: 
// Module Name:    serializer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module serializer(
	 input clk,
    input clk35,
	 input notclk35,
    input [6:0] data,
	 input rst,
    output out
    );

reg [6:0] buffer [1:0];	//	14 bits buffer
reg [1:0] shiftdata = 0;

reg datacount = 0; 
reg [2:0] outcount = 0;

reg DataInBuffer = 0;
reg SendOK = 0;

ODDR2 #(
      .DDR_ALIGNMENT("NONE") // Sets output alignment to "NONE", "C0" or "C1" 
   ) clock_forward_inst (
      .Q(out),     // 1-bit DDR output data
      .C0(clk35),  // 1-bit clock input
      .C1(notclk35), // 1-bit clock input
      .CE(1'b1),      // 1-bit clock enable input
      .D0(shiftdata[0]), // 1-bit data input (associated with C0)
      .D1(shiftdata[1]), // 1-bit data input (associated with C1)
      .R(1'b0),   // 1-bit reset input
      .S(1'b0)   // 1-bit set input
   );

always @(posedge clk or posedge rst)
begin
		if(rst == 1'b1)
		begin
			buffer[0] 		<= 7'b0000000;
			buffer[1] 		<= 7'b0000000;
			datacount 	<= 0;
			DataInBuffer <= 0;
		end
		else
		begin
			DataInBuffer <= 1;
			datacount <= datacount + 1;
			buffer[datacount] <= data;
			//buffer[datacount] <= {data[6],data[5],data[4],data[3],data[2],data[1],data[0]};
		end
end

always @(posedge clk35 or posedge rst)
begin
		if(rst == 1'b1)
		begin
			outcount <= 0;
			shiftdata <= 0;
			SendOK <= 0;
		end
		else
		begin
			if(outcount == 6)
				outcount <= 0;
			else
				outcount <= outcount + 1;
				
			if(DataInBuffer && outcount == 6)
					SendOK <= 1;
					
			if(SendOK)
			begin
				case (outcount)
					0:	shiftdata <= { buffer[0][0], buffer[0][1] };
					1:	shiftdata <= { buffer[0][2], buffer[0][3] };
					2:	shiftdata <= { buffer[0][4], buffer[0][5] };
					3:	shiftdata <= { buffer[0][6], buffer[1][0] };
					4:	shiftdata <= { buffer[1][1], buffer[1][2] };
					5:	shiftdata <= { buffer[1][3], buffer[1][4] };
					6:	shiftdata <= { buffer[1][5], buffer[1][6] };
				endcase
			end
		end
end

endmodule
