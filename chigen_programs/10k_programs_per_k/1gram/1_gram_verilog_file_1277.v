// Seed: 3534446869
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6[1-1'b0 :-1],
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  input wire id_13;
  assign module_1.id_12 = 0;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_17 = 32'd83,
    parameter id_23 = 32'd51,
    parameter id_24 = 32'd12
) (
    output tri0 id_0,
    output wor id_1,
    input uwire id_2#(
        .id_20 (1),
        .id_21 (-1),
        .id_22 (1 - 1),
        ._id_23(1),
        ._id_24(1)
    ),
    output wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    output supply1 id_6,
    input tri id_7,
    output tri0 id_8,
    input tri1 id_9,
    output tri0 id_10,
    output wand id_11,
    input wand id_12,
    output tri1 id_13,
    output wire id_14,
    output wor id_15,
    input wor id_16,
    input tri0 _id_17,
    input supply1 id_18
    , id_25, id_26
);
  wire [-1 : id_24] id_27;
  parameter id_28 = (-1);
  assign id_14 = id_23 - id_26 != id_18;
  logic [7:0] id_29;
  assign id_21 = -1'b0;
  wire [1 : 1 'b0] id_30;
  assign id_21 = -1 ^ {id_25{id_20}};
  always $signed(68);
  ;
  module_0 modCall_1 (
      id_20,
      id_26,
      id_30,
      id_26,
      id_21,
      id_29,
      id_28,
      id_28,
      id_30,
      id_25,
      id_30,
      id_26,
      id_30,
      id_21
  );
endmodule
