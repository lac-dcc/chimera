// Seed: 2753424908
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  assign module_1.id_19 = 0;
  inout wire id_1;
  parameter id_7 = 1;
  assign id_5 = id_4;
  wire id_8, id_9, id_10;
endmodule
module module_1 #(
    parameter id_4 = 32'd8
) (
    id_1,
    id_2,
    id_3#(
        ._id_4(1),
        .id_5 (id_6),
        .id_7 (1),
        .id_8 (-1)
    ),
    id_9[id_4 :-1],
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
    id_20,
    id_21,
    id_22
);
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output tri1 id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire _id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_20,
      id_22,
      id_22,
      id_5
  );
  input wire id_2;
  inout tri id_1;
  assign id_1  = 1;
  assign id_14 = -1'b0;
  logic id_23;
  logic [7:0] id_24;
  always
    if (1) @(posedge id_4, posedge id_24[1] - id_2 or posedge 1 - 1'b0) id_19 <= -1;
    else id_19 <= 1;
  wire id_25 = id_2;
endmodule
