// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module ALU (
	input wire[31:0] A,
	input wire[31:0] B,
	input wire[3:0] Op,
	output reg[31:0] alu_out,
	output reg[31:0] alu_out2
);

reg[63:0] big;
	
always @(Op, A, B) begin
	case (Op)
		4'b0001: alu_out = CLA (A, B);
		4'b0010: alu_out = subtract (A, B);
		4'b0011: begin
		big = Div(A,B);
			alu_out = big[31:0];
			alu_out2 = big[63:32];
			
		end
		
		4'b0100: begin
			big = Mul(A,B);
			alu_out = big[31:0];
			alu_out2 = big[63:32];
		end
		
		4'b0101: alu_out = And (A, B);
		4'b0110: alu_out = Or (A, B);
		4'b0111: alu_out = LogicalRightShift (A);
		4'b1000: alu_out = ArithmeticRightShift (A);
		4'b1001: alu_out = LeftShift (A);
		4'b1010: alu_out = RotateRight (A);
		4'b1011: alu_out = RotateLeft (A);
		4'b1100: alu_out = Neg (A);
		4'b1101: alu_out = Not (A);

		default alu_out = 32'bz;
	endcase
end

function [31:0] And (input [31:0] A, B);
      integer i;
		reg[31:0] result;
	begin
		
		for (i = 0; i < 32; i = i + 1) begin
			 result [i] = A [i] & B [i];
		end
		And = result;
	end
endfunction


function [31:0] Or (input [31:0] A, B);
	
	integer i;
	reg[31:0] result;
	
	begin
		for (i = 0; i < 32; i = i + 1) begin
			result [i] = A [i] | B [i];
		end
		Or = result;
	end
endfunction

function [31:0] Neg (input [31:0] A);
	reg [31:0] newReg;
	
	begin
		newReg = ~A + 1;
		Neg = newReg;
	end
endfunction

function [31:0] Not (input [31:0] A);
	reg [31:0] newReg;
	integer i;
	
	begin
		for (i = 0; i < 32; i = i + 1) begin
			if (A[i] == 0)
				newReg[i] = 1;
			else
				newReg[i] = 0;
		end
		Not = newReg;
	end
endfunction

function [31:0] CLA (input [31:0] A, B);
	
	reg [32:0] C;
	reg [31:0] G, P, sum;
	integer i;
	
	begin
		
		 C[0] = 0;
		for (i = 0; i < 32; i = i + 1) begin
			G[i] = A[i] & B[i];
			P[i] = A[i] | B[i];
			C[i + 1] = G[i] | (P[i] & C[i]);
			sum[i] = A[i] ^ B[i] ^ C[i];
		end
		CLA = sum;
	end

endfunction

function [31:0] subtract (input [31:0] A, B);
	reg [31:0] newReg;
	reg [32:0] C;
	reg [31:0] G, P, diff;
	integer i;
	
	begin
		newReg = ~B + 1;
		
		C[0] = 0;
		for (i = 0; i < 32; i = i + 1) begin
			G[i] = A[i] & newReg[i];
			P[i] = A[i] | newReg[i];
			C[i + 1] = G[i] | (P[i] & C[i]);
			diff[i] = A[i] ^ newReg[i] ^ C[i];
		end
		
		if (C [32] == 0)
			diff = ~diff + 1;
			
		subtract = diff;
	end
endfunction

function [31:0] LogicalRightShift (input [31:0] unshifted);
	
	reg[31:0] shifted;
	integer i;
	begin
		for (i = 0; i < 31; i = i + 1) begin
			shifted [i] = unshifted [i + 1];
		end
		shifted [31] = 0;
		LogicalRightShift = shifted;
	end
endfunction


function [31:0] ArithmeticRightShift (input [31:0] unshifted);
	
	reg[31:0] shifted;
	integer i;
	
	begin
		for (i = 0; i < 31; i = i + 1) begin
			shifted [i] = unshifted [i + 1];
		end
		shifted [31] = unshifted [31];
		ArithmeticRightShift = shifted;
	end
endfunction


function [31:0] LeftShift (input [31:0] unshifted);

   reg[31:0] shifted;
	integer i;
	begin
		for (i = 1; i < 32; i = i + 1) begin
			shifted [i] = unshifted [i - 1];
		end
		shifted [0] = 0;
		LeftShift = shifted;
	end
endfunction


function [31:0] RotateRight (input [31:0] unrotated);
	integer i;
	reg[31:0] rotated;
	
	begin
		
		for (i = 0; i < 31; i = i + 1) begin
			rotated [i] = unrotated [i + 1];
		end
		rotated [31] = unrotated [0];
		RotateRight = rotated;
	end
endfunction


function [31:0] RotateLeft (input [31:0] unrotated);
	
	reg[31:0] rotated;
	integer i;
	
	begin
	
		for (i = 1; i < 32; i = i + 1) begin
			rotated [i] = unrotated [i - 1];
		end
		rotated [0] = unrotated [31];
		RotateLeft = rotated;
	end
endfunction

// Multiplicant= A , Multiplier= B
function signed [63:0] Mul(input signed [31:0] A, B);
    reg signed [63:0] accumulator;   
    reg signed [31:0] Multiplier; 
    reg AuxiliaryBit;                
    reg [5:0] Count;         
    reg signed [63:0] SignExtendedOperand;
	 
	 begin
    SignExtendedOperand = {{32{A[31]}}, A};
    accumulator = 0;
    Multiplier = B;
    AuxiliaryBit = 0;
    Count = 0;

    while (Count < 32) begin
       
        case ({Multiplier[0], AuxiliaryBit})
            2'b01: accumulator = accumulator + SignExtendedOperand;
            2'b10: accumulator = accumulator - SignExtendedOperand;
            default: ; // No operation for other cases
        endcase

        // Arithmetic right shift
        {accumulator, Multiplier, AuxiliaryBit} = {accumulator[63], accumulator, Multiplier, AuxiliaryBit} >> 1;

        Count = Count + 1;
    end
	 
	 accumulator= {accumulator [31:0],Multiplier};
	
    Mul = accumulator;
	 
	 end
endfunction


// dividend= A , divisor= B
function [64:0] Div (input signed [31:0] A, B);
	reg [31:0] accumulator;
	reg [31:0] M;
	reg [31:0] Q;
	reg [31:0] quotient;
	reg [31:0] remainder;
	
	
	integer Count;
	begin
	
	Count=0;
	accumulator = 32'b0;
	M =B;
	Q =A;
	
	if (M[31]) M=~B +1;
	if (Q[31]) Q=~A +1;
	
	while (Count <32) begin
		
		{accumulator,Q} = {accumulator,Q} << 1;
		accumulator = accumulator - M;             
            
		if (accumulator[31] == 0) begin    
			Q[0] = 1;
		end 
			
		else if (accumulator[31] == 1) begin
			Q[0] = 0;
			accumulator = accumulator + M;
		end
	
		Count = Count + 1;
	end
	
	if (A[31] & B[31]) begin
	quotient= Q ;	
	remainder= accumulator;
	end
	else if (A[31] | B[31]) begin
	quotient= ~Q +1 ;	
	remainder= ~accumulator +1 ;
	end
	else begin
	quotient= Q;	
	remainder= accumulator;
	end
	
	Div = {remainder, quotient};
	end
endfunction 
endmodule
