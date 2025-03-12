// Seed: 741370570
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output wor id_2,
    output supply1 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input uwire id_6,
    input wire id_7,
    output wire id_8,
    output tri1 id_9,
    input supply0 id_10,
    input wand id_11,
    output wand id_12,
    input wor id_13,
    output tri0 id_14,
    output uwire id_15,
    output wor id_16,
    input uwire id_17
);
endmodule
module module_1 #(
    parameter id_0  = 32'd42,
    parameter id_10 = 32'd90,
    parameter id_3  = 32'd47
) (
    input wand _id_0,
    output tri0 id_1,
    input wire id_2,
    output supply1 _id_3,
    output supply0 id_4,
    output wand id_5,
    output wire id_6,
    input tri id_7
);
  logic [7:0] id_9;
  assign #(1, 1) id_9[""] = id_7;
  wire _id_10;
  wire [id_0 : -1] id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_1,
      id_7,
      id_5,
      id_7,
      id_7,
      id_4,
      id_4,
      id_2,
      id_7,
      id_6,
      id_7,
      id_4,
      id_6,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
  logic [id_3  .  id_10 : ""] id_12 = id_2;
  parameter id_13 = 1;
  wire id_14;
  ;
endmodule
