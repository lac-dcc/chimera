// Seed: 1753830329
module module_0 (
    input wand id_0,
    output wire id_1,
    input supply1 id_2,
    output wor id_3,
    output wire id_4,
    output supply1 id_5,
    output supply1 id_6
);
  assign id_3 = id_0;
  assign module_1.id_19 = 0;
  assign id_1 = 1;
endmodule
module module_1 #(
    parameter id_23 = 32'd29,
    parameter id_24 = 32'd43,
    parameter id_7  = 32'd35
) (
    output tri1 id_0,
    input wor id_1,
    output tri1 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wor id_5,
    input supply1 id_6,
    input tri0 _id_7,
    output wor id_8,
    input uwire id_9,
    input tri id_10,
    output wire id_11#(
        ._id_23((1)),
        ._id_24(1'b0)
    ),
    input tri1 id_12,
    input uwire id_13,
    output tri1 id_14,
    output wand id_15
    , id_25,
    input supply1 id_16,
    input tri1 id_17[id_24 : 1 'b0 **  !  id_7],
    input uwire id_18,
    input supply1 id_19,
    input wand id_20,
    input tri id_21
);
  assign id_8 = id_9;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_1,
      id_8,
      id_14,
      id_11,
      id_0
  );
  wire [1 : id_23] id_26 = id_20;
  and primCall (
      id_0,
      id_21,
      id_17,
      id_10,
      id_20,
      id_6,
      id_18,
      id_12,
      id_25,
      id_19,
      id_1,
      id_13,
      id_5,
      id_9,
      id_16
  );
  assign id_14 = id_24;
  wor id_27 = {(id_9 == 1) {-1'b0}}, id_28 = 1;
  assign id_4 = id_13;
  wire  id_29 = id_12;
  logic id_30;
endmodule
