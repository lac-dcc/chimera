// Seed: 3571402856
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = !id_3 ? 1 : 1;
  wire \id_6 ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_10(
      .id_0(id_2[-1'b0]), .id_1(!id_6), .id_2(id_4), .id_3(!id_3[1&!-1]), .id_4(), .id_5(id_3)
  );
  bit id_11;
  id_12(
      .id_0($realtime), .id_1(id_10), .id_2(!1), .id_3((id_2)), .id_4(id_5)
  );
  initial begin : LABEL_0
    id_5 <= id_11;
  end
  logic [7:0] id_13;
  wire id_14;
  wire id_15;
  wire id_16;
  assign id_13[~$realtime] = 1'b0;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_15,
      id_1,
      id_14
  );
endmodule
