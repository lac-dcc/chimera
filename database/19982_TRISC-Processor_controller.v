// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - TRISC Processor Controller

module controller
(
	input SysClock,StartStop,LDA,STA,ADD,SUB,XOR,INC,CLR,JMP,JPZ,JPN,HLT,
	output reg C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14
);
	reg [4:0] state,nextstate;
	parameter A=5'b00000,B=5'b00001,C=5'b00010,D=5'b00011,E=5'b00100,F=5'b00101,G=5'b00110,H=5'b00111,I=5'b01000,J=5'b01001,K=5'b01010,L=5'b01011,
	M=5'b01100,N=5'b01101, O=5'b01110,P=5'b01111,Q=5'b10000,R=5'b10001,S=5'b10010,T=5'b10011,U=5'b10100;
	always @ (negedge SysClock,negedge StartStop)
		if (StartStop==1'b0) state <= A; else state <= nextstate;
	always @ (state,INC,CLR,JMP,LDA,STA,ADD)
		case (state)
			A: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b10000000000000; nextstate = B; end //INITIALIZE
			B: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00010000000000; nextstate = C; end //FETCH
			C: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00011000000000; nextstate = D; end //FETCH
			D: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00011000000000; nextstate = E; end //FETCH
			E: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00110100000000; //DECODE
				if (INC) nextstate = F;
					else if (CLR) nextstate = G; 
						else if (JMP) nextstate = H;
							else if (LDA) nextstate = I;
								else if (STA) nextstate = M;
									else if (ADD) nextstate = P; end
			F: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000001000000; nextstate = B; end //INC=0110
			G: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000010000000; nextstate = B; end //CLR=0111
			H: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b01000000000000; nextstate = B; end //JMP=1000
			I: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000000000000; nextstate = J; end //LDA=0000
			J: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00001000000000; nextstate = K; end //LDA
			K: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00001000000000; nextstate = L; end //LDA
			L: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000000001000; nextstate = B; end //LDA
			M: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000000000000; nextstate = N; end //STA (START)
			N: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00001000100000; nextstate = O; end //STA
			O: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00001000100000; nextstate = B; end //STA
			P: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000000000000; nextstate = Q; end //ADD
			Q: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00001000000000; nextstate = R; end //LDR
			R: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00001000000000; nextstate = S; end //LDR
			S: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000000000000; nextstate = T; end //ADD
			T: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000000011001; nextstate = B; end //BUFF
			//U: begin {C0,C1,C2,C3,C4,C7,C8,C9,C5,C10,C11,C12,C13,C14} = 14'b00000000001000; nextstate = B; end //ACC
		endcase
endmodule 