module MULTIPLIER(A,B,Op,HI,LO);

    input [31:0] A,B;
    input [1:0]  Op;
    output reg[31:0] HI,LO;
                
    always @(Op) begin
      case (Op)
          2'b00: {HI,LO} <= $signed(A) * $signed(B);
          2'b01: {HI,LO} <= A * B;
          2'b10: begin 
                 LO <= $signed(A) / $signed(B);
                 HI <= $signed(A) % $signed(B);
                 end
          2'b11: begin 
                 LO <= A / B;
                 HI <= A % B;
                 end
      endcase
    end
endmodule


