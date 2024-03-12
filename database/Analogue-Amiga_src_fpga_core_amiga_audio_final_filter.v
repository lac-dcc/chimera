module audio_final_filter (
	input audio_clk,
	input reset_l,
	
	input audio_signed,
	input [15:0]	left_input,
	input [15:0]	right_input,
	
	input [1:0]		mixing,
	
	output reg [15:0]	left_output,
	output reg [15:0] right_output
);

reg [16:0] al0, al1, al2;
reg [16:0] ar0, ar1, ar2;

always @(posedge audio_clk or negedge reset_l) begin
	if (~reset_l) begin
		{al0, al1, al2} <= 0;
		{ar0, ar1, ar2} <= 0;
	end
	else begin
		al0 <= {{2{~audio_signed ^  left_input[15]}},  left_input[14:0]};
		ar0 <= {{2{~audio_signed ^ right_input[15]}}, right_input[14:0]};
		
		case (mixing)
			3 : begin
				al1 <= {al0[16], al0[16:1]} + $signed(ar0[15:0]);
				ar1 <= {ar0[16], ar0[16:1]} + $signed(al0[15:0]);
			
			end
			2 : begin
			
				al1 <= $signed(al0) - $signed(al0[16:2]) + $signed(ar0[15:1]);
				ar1 <= $signed(ar0) - $signed(ar0[16:2]) + $signed(al0[15:1]);
			end
			1 : begin
				al1 <= $signed(al0) - $signed(al0[16:3]) + $signed(ar0[15:2]);
				ar1 <= $signed(ar0) - $signed(ar0[16:3]) + $signed(al0[15:2]);
			end
			
			default : begin
				al1 <= al0;
				ar1 <= ar0;
			end
		endcase
		left_output 	<= ^al1[16:15] ? {al1[16],{15{al1[15]}}} : al1[15:0];
		right_output 	<= ^ar1[16:15] ? {ar1[16],{15{ar1[15]}}} : ar1[15:0];
			
	end
end

endmodule