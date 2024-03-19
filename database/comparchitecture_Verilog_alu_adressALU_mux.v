module mux
(
	input   [31:0]	in1, in2, in3,
    	input   [5:0]	funct,
    	input	[4:0]	rd
);

	always@ (*) begin
		case (funct)
			6'b100000: begin
				glob.r[rd] = in1;
			end
			6'b100010: begin
				glob.r[rd] = in2;
			end
			6'b000010: begin
				glob.r[rd] = in3;
			end
		endcase
	end

endmodule
