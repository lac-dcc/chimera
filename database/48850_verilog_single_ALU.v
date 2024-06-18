// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module ALU(A,B,ALUC,ZERO,OF,OUT);
	input [31:0] A,B;
	input [2:0] ALUC;
	output reg ZERO , OF;
	output reg [31:0] OUT;
	always @(*)
	begin
		case(ALUC)
		3'b000:
			begin //add
				OUT = A+B;
				ZERO = (OUT)?0:1;
				OF = (A[31]&&B[31]&&!OUT[31])||(!A[31]&&!B[31]&&OUT[31]);
			end
		3'b001: //sub
			begin
				OUT = A-B;
				ZERO = (OUT)?0:1;
				OF = (!A[31]&&B[31]&&OUT[31])||(A[31]&&!B[31]&&!OUT[31]);
			end
		3'b010: //or
			begin
				OF = 0;
				OUT = A | B;
				ZERO = (OUT)?0:1;
			end
		3'b011: //and
			begin
				OF = 0;
				OUT = A & B;
				ZERO = (OUT)?0:1;
			end
		3'b100: //sll
			begin
				OF = 0;
				OUT = A << B[4:0]; //只取5位
				ZERO = (OUT)?0:1;
			end
		3'b101: //srl
			begin
				OF = 0;
				OUT = A >> B[4:0];
				ZERO = (OUT)?0:1;
			end
		3'b110: //sra
			begin
				OF = 0;
				OUT = A >>> B[4:0];
				ZERO = (OUT)?0:1;
			end
		default:
			begin
				OUT = 0;
				OF = 0;
				ZERO = 0;
			end
		endcase
	end
endmodule


