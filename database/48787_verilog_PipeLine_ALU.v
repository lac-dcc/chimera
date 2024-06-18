// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module ALU(A,B,ALUC,ZERO,OF,SF,OUT);
	input [31:0] A,B;
	input [3:0] ALUC;
	output reg ZERO , OF, SF;
	output reg [31:0] OUT;
	always @(*)
	begin
		case(ALUC)
		4'b0000:
			begin //add
				OUT = A+B;
				ZERO = (OUT)?0:1;
				OF = (A[31]&&B[31]&&!OUT[31])||(!A[31]&&!B[31]&&OUT[31]);
			end
		4'b0001: //sub
			begin
				OUT = A-B;
				ZERO = (OUT)?0:1;
				OF = (!A[31]&&B[31]&&OUT[31])||(A[31]&&!B[31]&&!OUT[31]);
			end
		4'b0010: //or
			begin
				OF = 0;
				OUT = A | B;
				ZERO = (OUT)?0:1;
			end
		4'b0011: //and
			begin
				OF = 0;
				OUT = A & B;
				ZERO = (OUT)?0:1;
			end
		4'b0100: //sll
			begin
				OF = 0;
				OUT = B << A[4:0]; //只取5位
				ZERO = (OUT)?0:1;
			end
		4'b0101: //srl
			begin
				OF = 0;
				OUT = B >> A[4:0];
				ZERO = (OUT)?0:1;
			end
		4'b0110: //sra
			begin
				OF = 0;
				OUT = ($signed(B)) >>> A[4:0];
				ZERO = (OUT)?0:1;
			end
		4'b0111: //xor
			begin
				OF = 0;
				OUT = A ^ B;
				ZERO = (OUT)?0:1;
			end
		4'b1000: //nor
			begin
				OF = 0;
				OUT = ~(A | B);
				ZERO = (OUT)?0:1;
			end
		default:
			begin
				OUT = 0;
				OF = 0;
				ZERO = 0;
			end
		endcase
		SF = OUT[31];
	end
endmodule



