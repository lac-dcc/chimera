// This program was cloned from: https://github.com/cmdc0de/mysoc
// License: MIT License

module dff (input d, input re, input we, input rstn, input clk, output reg q);

	reg value;
	always @(posedge clk or negedge rstn)
	begin
		if (!rstn) 
		begin 
			value <=0;
			q<=value;
		end
		else if (!re) value<=d;
		else if (!we) q<=value;
		//$display("value = 0x%0h",value);
	end
endmodule
