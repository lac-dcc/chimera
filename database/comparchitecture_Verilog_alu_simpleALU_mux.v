module mux
(
    input      [31:0] in1, in2, in3,
    input      [5:0] funct,
    output     [31:0] rd
);

	reg [31:0] temp;

	always@ (*) begin
		case (funct)
			6'b100000: begin
				temp = in1;
			end
			6'b100010: begin
				temp = in2;
			end
			6'b000010: begin
				temp = in3;
			end
			default: begin
							
			end
		endcase
	end

    assign rd = temp;

endmodule
