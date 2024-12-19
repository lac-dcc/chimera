// Seed: 4234828213
module module_0 (
    input wand id_0,
    input wor id_1,
    output supply0 id_2,
    output supply1 id_3,
    output uwire id_4,
    input wand id_5,
    output tri0 id_6
);
  wire id_8;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    input wire id_2,
    output tri1 id_3,
    input wire id_4,
    input tri1 id_5,
    output supply0 id_6,
    output wor id_7,
    output tri id_8,
    output supply1 id_9,
    input tri1 id_10,
    output wire id_11,
    input tri1 id_12,
    output uwire id_13,
    input wand id_14,
    output tri1 id_15
);
  genvar id_17, id_18;
  assign id_17 = 1;
  assign id_15 = id_2;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_3,
      id_13,
      id_12,
      id_6
  );
  assign modCall_1.id_3 = 0;
  assign id_13 = 1'b0 ? 1'b0 : 1;
  and primCall (id_6, id_18, id_5, id_0, id_14, id_10, id_2, id_12, id_1, id_17);
endmodule
