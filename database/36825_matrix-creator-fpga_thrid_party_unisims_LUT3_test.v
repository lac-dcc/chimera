// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

module LUT3 #( 
	parameter INIT = 8'he4
)(I2,I1,I0,O);


input I1;
input I2;
input I0;
output O;	


assign O = out;

reg out;
wire [7:0] init;
assign init = INIT;

always @(*) begin
	case({I2,I1,I0})
		3'b000: begin
			out = INIT[0];
		end
		3'b001: begin
			out = INIT[1];
		end
		3'b010: begin
			out = INIT[2];
		end
		3'b011: begin
			out = INIT[3];
		end
		3'b100: begin
			out = INIT[4];
		end
		3'b101: begin
			out = INIT[5];
		end
		3'b110: begin
			out = INIT[6];
		end
		3'b111: begin
			out = INIT[7];
		end
	endcase
end

/*
LUT3 LUT3_mux (.O (out),
                         .I0 (sel),
                         .I1 (a),
                         .I2 (b));
defparam LUT3_mux.INIT = 8'he4; 
*/

endmodule
