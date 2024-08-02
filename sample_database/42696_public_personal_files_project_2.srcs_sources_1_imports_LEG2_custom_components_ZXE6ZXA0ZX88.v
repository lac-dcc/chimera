// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

module ZXE6ZXA0ZX88 (clk, rst, POP, PUSH, VALUE, OUTPUT);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [0:0] POP;
  input  wire [0:0] PUSH;
  input  wire [7:0] VALUE;
  output  wire [7:0] OUTPUT;

  TC_Switch # (.UUID(64'd4970243945063505598 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_0 (.en(wire_9), .in(wire_17[7:0]), .out(OUTPUT));
  TC_Ram # (.UUID(64'd1727483883214192042 ^ UUID), .WORD_WIDTH(64'd8), .WORD_COUNT(64'd32)) Ram_1 (.clk(clk), .rst(rst), .load(wire_9), .save(wire_2), .address(wire_12[31:0]), .in0({{56{1'b0}}, wire_8 }), .in1(64'd0), .in2(64'd0), .in3(64'd0), .out0(wire_17), .out1(), .out2(), .out3());
  TC_Or # (.UUID(64'd1633899609590120249 ^ UUID), .BIT_WIDTH(64'd1)) Or_2 (.in0(wire_9), .in1(wire_4), .out(wire_2));
  TC_Mux # (.UUID(64'd1415299812966211401 ^ UUID), .BIT_WIDTH(64'd8)) Mux8_3 (.sel(wire_9), .in0(wire_1), .in1(wire_11), .out(wire_8));
  TC_Constant # (.UUID(64'd2617534626834808358 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h0)) Constant8_4 (.out(wire_11));
  TC_Not # (.UUID(64'd940376475133418304 ^ UUID), .BIT_WIDTH(64'd1)) Not_5 (.in(wire_4), .out(wire_5));
  TC_Not # (.UUID(64'd2877801287239300830 ^ UUID), .BIT_WIDTH(64'd1)) Not_6 (.in(wire_9), .out(wire_6));
  TC_DelayLine # (.UUID(64'd1474575109360942507 ^ UUID), .BIT_WIDTH(64'd1)) DelayLine1_7 (.clk(clk), .rst(rst), .in(wire_6), .out(wire_10));
  TC_And # (.UUID(64'd3845495794179041689 ^ UUID), .BIT_WIDTH(64'd1)) And_8 (.in0(wire_10), .in1(wire_14), .out(wire_18));
  TC_Not # (.UUID(64'd1967795652482915301 ^ UUID), .BIT_WIDTH(64'd1)) Not_9 (.in(wire_6), .out(wire_14));
  TC_Or # (.UUID(64'd1678926546869099008 ^ UUID), .BIT_WIDTH(64'd1)) Or_10 (.in0(wire_18), .in1(wire_9), .out(wire_0));
  TC_Counter # (.UUID(64'd1746379941722064965 ^ UUID), .BIT_WIDTH(64'd64), .count(64'd1)) Counter64_11 (.clk(clk), .rst(rst), .save(wire_5), .in(wire_16), .out(wire_16));
  TC_Counter # (.UUID(64'd866571610061658418 ^ UUID), .BIT_WIDTH(64'd64), .count(64'd1)) Counter64_12 (.clk(clk), .rst(rst), .save(wire_6), .in(wire_7), .out(wire_7));
  TC_Neg # (.UUID(64'd2527186048197338913 ^ UUID), .BIT_WIDTH(64'd64)) Neg64_13 (.in(wire_13), .out(wire_19));
  TC_Add # (.UUID(64'd734649083867931585 ^ UUID), .BIT_WIDTH(64'd64)) Add64_14 (.in0(wire_16), .in1(wire_19), .ci(1'd0), .out(wire_12), .co());
  TC_Add # (.UUID(64'd793227160646827733 ^ UUID), .BIT_WIDTH(64'd64)) Add64_15 (.in0(wire_7), .in1(wire_3), .ci(1'd0), .out(wire_15), .co());
  TC_Mux # (.UUID(64'd3533169032004399328 ^ UUID), .BIT_WIDTH(64'd64)) Mux64_16 (.sel(wire_0), .in0(wire_7), .in1(wire_15), .out(wire_13));
  TC_Constant # (.UUID(64'd134094643562568606 ^ UUID), .BIT_WIDTH(64'd64), .value(64'h1)) Constant64_17 (.out(wire_3));

  wire [0:0] wire_0;
  wire [7:0] wire_1;
  assign wire_1 = VALUE;
  wire [0:0] wire_2;
  wire [63:0] wire_3;
  wire [0:0] wire_4;
  assign wire_4 = PUSH;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [63:0] wire_7;
  wire [7:0] wire_8;
  wire [0:0] wire_9;
  assign wire_9 = POP;
  wire [0:0] wire_10;
  wire [7:0] wire_11;
  wire [63:0] wire_12;
  wire [63:0] wire_13;
  wire [0:0] wire_14;
  wire [63:0] wire_15;
  wire [63:0] wire_16;
  wire [63:0] wire_17;
  wire [0:0] wire_18;
  wire [63:0] wire_19;

endmodule
