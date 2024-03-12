module alu(
     input [31:0] A,
     input [31:0] B,
     input [2:0] ALUOp,       
    output reg [31:0] C
  );
  initial begin
    C<=0;
  end
  always@(*) begin
    if(ALUOp==0)begin
       C <= A+B;      
    end
    else if(ALUOp==1)begin
       C<=A-B;
    end
    else if(ALUOp==2)begin
       C<=A&B;
    end
    else if(ALUOp==3)begin
       C<=A|B;
    end
    else if(ALUOp==4)begin
       C<=A>>B;
    end
    else if(ALUOp==5)begin
       C<=$signed(A)>>>B;
    end
  end
endmodule