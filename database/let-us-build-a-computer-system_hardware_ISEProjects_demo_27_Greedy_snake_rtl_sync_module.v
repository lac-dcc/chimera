// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module sync_module
(
	input CLK_40M,
	input RSTn,
	output reg end_sig,
	output reg start
);	
	
	
	
	reg [31:0] Count;
	parameter T1s = 32'd25_000_000;
	
	
	
	always @ (posedge CLK_40M or negedge RSTn)
	if(!RSTn)
	begin
		end_sig <= 1'b0;
		start <= 1'b1;
	end
	else if(Count == T1s)
			begin
				start <= ~start;
				end_sig <= ~end_sig;
			end
	else
	begin
		end_sig <= end_sig;
		start <= start;
	end
	
	

	always @ (posedge CLK_40M or negedge RSTn)
	if(!RSTn)
	begin
		Count <= 32'b0;
	end
	else if(Count == T1s)
			Count <= 32'b0;
	else
		Count <= Count + 32'd1;
	
	
endmodule 