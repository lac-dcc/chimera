// This program was cloned from: https://github.com/maxs-well/ad7606-driver-verilog
// License: GNU General Public License v2.0

module generate_en
#
(
parameter INTERVAL_CNT = 250
)
(
	input					clk		,
	input					rst_n		,
	
	output	reg		en_o	
);

reg [31:0]	cnt;

always @ (posedge clk or negedge rst_n)
begin 
	if (!rst_n)
	begin
		cnt	<=	'd0;
		en_o	<=	'd0;
	end
	else if (cnt >= INTERVAL_CNT - 1)
	begin
		cnt 	<=	'd0;
		en_o	<=	1'b1;
	end
	else
	begin
		cnt 	<= cnt + 32'd1;
		en_o	<=	1'b0;
	end
end

endmodule
