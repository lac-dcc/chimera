// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

/*
* @author cmdc0de
* @params:
* 	clk = clock
* 	we = write enable active low, write inData to Register
* 	sel = select register active low
* 	rstn = active low
*
* 	we low & sel low write data from inData to internal register MyData
* 	put data from MyData into outData when sel is low and we is high
* 	otherwise set outData to HIZ
*
*/
module register #(parameter WIDTH=16)(
	input wire clk, 
	input wire we, 
	input wire sel,
	input wire rstn,
	input wire [WIDTH-1:0] inData, 
	output wire [WIDTH-1:0] outData);

	reg [WIDTH-1:0] MyData;

	always @(posedge clk)
	begin
		if (!rstn) begin
			MyData <= 0;
		end
		else begin
			if (~sel & ~we) 
				MyData <= inData;
			else
				MyData <= MyData;
		end
	end

	assign outData = (~sel & we) ? MyData : WIDTH-1'bz;

endmodule
