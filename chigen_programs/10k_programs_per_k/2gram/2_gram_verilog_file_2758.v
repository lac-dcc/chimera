// Seed: 4110233561
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wand id_2,
    output tri id_3,
    input wor id_4,
    input supply1 id_5,
    input tri id_6,
    output supply1 id_7,
    output tri0 id_8
);
  assign id_3 = id_4;
  wire id_10;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1,
    input wor id_2,
    output tri id_3,
    output tri id_4,
    input wire id_5,
    output supply1 id_6,
    output tri1 id_7,
    input uwire id_8,
    input wand id_9,
    input supply1 id_10,
    output wire id_11,
    output wand id_12,
    input tri0 id_13,
    input tri0 id_14
);
  assign id_3 = id_9 ? 1'b0 - id_9 : (id_13) ? 1 : id_9;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_14,
      id_4,
      id_9,
      id_2,
      id_2,
      id_4,
      id_1
  );
endmodule
