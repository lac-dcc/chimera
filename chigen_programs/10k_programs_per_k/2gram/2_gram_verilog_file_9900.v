// Seed: 3291990941
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_1 = id_3;
  logic id_7;
  ;
  id_8 :
  assert property (@(-1) id_6)
  else;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  logic id_3 = -1;
endmodule
module module_2 #(
    parameter id_5 = 32'd50
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  input wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire _id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_6,
      id_19,
      id_19
  );
  assign modCall_1.id_8 = 0;
  output wire id_2;
  inout wire id_1;
  parameter [id_5 : 1] id_20 = -1;
endmodule
