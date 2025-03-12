// Seed: 1192482717
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_0 #(
    parameter id_14 = 32'd96,
    parameter id_15 = 32'd75
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    module_1,
    id_12,
    id_13,
    _id_14,
    _id_15,
    id_16
);
  input wire id_16;
  inout wire _id_15;
  inout wire _id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_6
  );
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  struct packed {
    logic [id_14 : -1] id_17;
    struct packed {
      logic id_18;
      logic ["" : 1] id_19;
    } ["" : 1] id_20;
  } id_21;
  generate
    assign id_4[~id_15 : 1] = id_21.id_20;
  endgenerate
  assign id_21 = -1;
endmodule
