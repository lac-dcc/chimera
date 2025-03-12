// Seed: 1238152912
module module_0 #(
    parameter id_22 = 32'd28,
    parameter id_27 = 32'd69,
    parameter id_31 = 32'd70
) (
    inout uwire id_0,
    input supply0 id_1,
    output supply1 id_2,
    input tri id_3,
    input wand id_4,
    output uwire id_5,
    input wor id_6,
    input tri0 id_7,
    output wire id_8,
    input wand id_9,
    output wand id_10,
    input tri0 id_11,
    input supply0 id_12,
    input supply0 id_13,
    output supply0 id_14,
    input tri id_15,
    output supply0 id_16,
    input wand id_17#(
        ._id_22(1'b0),
        .id_23 (1),
        .id_24 (-1'b0),
        .id_25 (1'h0),
        .id_26 (-1),
        ._id_27(1),
        .id_28 ((1'h0)),
        .id_29 (1 + 1),
        .id_30 (1),
        ._id_31((1)),
        .id_32 (-1)
    ),
    input supply1 id_18,
    input tri1 id_19,
    output uwire id_20
);
  union packed {
    struct packed {
      id_33 id_34;
      logic [id_31 : 1] id_35;
    } id_36;
    logic [id_22 : id_27] id_37;
  } id_38 = -1 && 1;
  assign id_38.id_33 = 1;
  parameter id_39 = -1;
  assign id_38.id_36 = id_9;
  wire id_40;
endmodule
module module_1 (
    output uwire id_0,
    inout  wire  id_1,
    output tri0  id_2,
    output tri1  id_3,
    input  tri0  id_4,
    input  uwire id_5,
    input  wire  id_6
);
  logic id_8;
  ;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_3,
      id_1,
      id_6,
      id_1,
      id_5,
      id_6,
      id_3,
      id_5,
      id_0,
      id_5,
      id_5,
      id_6,
      id_2,
      id_5,
      id_0,
      id_1,
      id_5,
      id_6,
      id_0
  );
  assign modCall_1.id_17 = 0;
  logic id_9 = -1;
endmodule
