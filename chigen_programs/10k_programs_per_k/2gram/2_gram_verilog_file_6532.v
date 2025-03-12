// Seed: 4140104644
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_11 = 32'd17,
    parameter id_2  = 32'd97
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12
);
  output wire id_12;
  input wire _id_11;
  inout logic [7:0] id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  input wire _id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_9,
      id_5
  );
  always_latch begin : LABEL_0
    id_10[id_2 :-1] = id_3[id_11];
  end
  logic id_13;
endmodule
