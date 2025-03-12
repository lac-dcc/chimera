// Seed: 4149570960
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5#(
        .id_6(1 & id_7),
        .id_8(-1)
    ),
    id_9,
    id_10,
    id_11
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
  wire [1 : 1] id_13, id_14, id_15;
  assign id_12 = 1;
  logic id_16;
  assign id_13 = id_15;
endmodule
module module_1 #(
    parameter id_1  = 32'd90,
    parameter id_14 = 32'd82
) (
    _id_1,
    id_2,
    id_3[1 : id_14],
    id_4,
    id_5,
    id_6[1 : id_1],
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15
);
  inout wire id_15;
  inout wire _id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_8,
      id_7,
      id_13,
      id_15,
      id_7,
      id_15
  );
  output logic [7:0] id_6;
  input wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  output wire _id_1;
  assign id_15 = id_15;
  assign id_11 = id_2;
  union packed {
    logic id_16;
    id_17 id_18;
  } id_19;
  ;
endmodule
