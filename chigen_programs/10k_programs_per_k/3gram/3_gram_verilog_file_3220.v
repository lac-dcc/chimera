// Seed: 198317904
module module_0 (
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
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_7 = 32'd56
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire _id_7;
  inout wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_12,
      id_6,
      id_10,
      id_6,
      id_14,
      id_13,
      id_6,
      id_13,
      id_11
  );
  output wire id_2;
  input wire id_1;
  assign id_10 = {id_5{id_4[id_7]}};
  logic id_15;
endmodule
