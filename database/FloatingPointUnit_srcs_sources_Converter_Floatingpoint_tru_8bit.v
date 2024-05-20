// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License


module botru(in1, S, Cout,dau);
  input [7:0] in1;
  output [7:0] S;
  output Cout;
  output [7:0]dau;
 wire [7:0]in11,in22,in111; 
wire Cout;
wire [7:0]dau;
assign in111=~in1;
assign in11=(in1>=(8'b0111_1111))?in1:in111;
assign in22=(in1>=(8'b0111_1111))?(8'b1000_0001):(8'b1000_0000);
cong_8bit r(in11,in22,S,Cout);
  assign dau=(in1>=(8'b0111_1111))?(8'h2B):(8'h2D); //   + -
endmodule


module t_botru;
	reg [7:0]in1;
	wire [7:0]S;
         wire Cout;
        wire [7:0]dau;
parameter time_out = 100;
	botru z(.in1(in1),.S(S),.Cout(Cout),.dau(dau));
      
initial $monitor($time," so in1 %d , %c %d ,dau  %b  ", in1,dau,S,Cout );
	initial begin

	#0 in1=8'b1000_0000;
        #10 in1=8'b1000_1010;
        #10 in1=8'b0010_1111;
        #10 in1=8'b0111_1111;
	
end 
endmodule
