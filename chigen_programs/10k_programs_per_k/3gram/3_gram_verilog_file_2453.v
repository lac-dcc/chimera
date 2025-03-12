// Seed: 134228533
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_5;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd81,
    parameter id_2  = 32'd93,
    parameter id_3  = 32'd58
) (
    input wand id_0,
    output supply1 id_1,
    output supply0 _id_2,
    input wand _id_3,
    output wand id_4,
    input wand id_5,
    input tri id_6,
    input supply0 id_7,
    input wor id_8,
    output tri id_9,
    input wor id_10,
    input uwire _id_11,
    output uwire id_12,
    input wand id_13,
    input tri id_14,
    input tri0 id_15
    , id_18,
    input wand id_16
);
  struct packed {
    struct packed {
      logic [id_3 : id_2] id_19;
      logic id_20;
    } [id_2 : id_3] id_21;
  } [-1 'b0 : id_11]
      id_22, id_23;
  parameter id_24 = 1;
  nand primCall (
      id_9,
      id_22,
      id_8,
      id_13,
      id_19,
      id_18,
      id_6,
      id_5,
      id_10,
      id_7,
      id_14,
      id_23,
      id_15,
      id_20,
      id_16
  );
  module_0 modCall_1 (
      id_23,
      id_21,
      id_21,
      id_21,
      id_24
  );
endmodule
