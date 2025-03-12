// Seed: 3086047898
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire [-1 : 1] id_8;
endmodule
module module_1 #(
    parameter id_8 = 32'd31
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
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
    id_19,
    id_20
);
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  module_0 modCall_1 (
      id_1,
      id_19,
      id_13,
      id_18,
      id_1,
      id_20,
      id_18
  );
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire _id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout logic [7:0] id_2;
  inout wire id_1;
  assign id_2[id_8 : 1] = id_1;
  assign id_2[1] = 1'b0 & id_19;
endmodule
