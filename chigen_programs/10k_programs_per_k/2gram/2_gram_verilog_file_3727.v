// Seed: 1028405676
module module_0 (
    input wire id_0,
    input wire id_1,
    output wire id_2,
    input supply0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    output wand id_6,
    input uwire id_7,
    output tri0 id_8,
    input wor id_9,
    input tri0 id_10,
    input supply1 id_11,
    output wor id_12,
    input supply1 id_13,
    output wand id_14,
    output wire id_15
);
  wire id_17 = id_4;
  parameter id_18#(
      .id_19(1),
      .id_20(-1),
      .id_21(-1'b0),
      .id_22(id_20 << 1),
      .id_23(1),
      .id_24(id_20),
      .id_25(-1),
      .id_26(1),
      .id_27(id_21),
      .id_28(id_20)
  ) = id_21;
  assign module_1.id_8 = 0;
  `define pp_29 0
endmodule
module module_1 #(
    parameter id_0 = 32'd17,
    parameter id_6 = 32'd6
) (
    input wand _id_0,
    input wand id_1,
    output tri id_2,
    input supply1 id_3,
    output tri id_4,
    output uwire id_5,
    input tri _id_6,
    output supply0 id_7,
    input wand id_8
    , id_13,
    output uwire id_9,
    output tri id_10,
    input wor id_11
);
  wire [id_0 : id_6] id_14;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_9,
      id_8,
      id_1,
      id_3,
      id_4,
      id_8,
      id_10,
      id_1,
      id_1,
      id_11,
      id_4,
      id_1,
      id_2,
      id_4
  );
  wire id_15;
  ;
endmodule
