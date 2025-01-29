// Seed: 36639305
module module_0 (
    input tri1 id_0,
    output tri id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    output uwire id_5,
    input wand id_6,
    input tri1 id_7,
    output supply1 id_8,
    output tri0 id_9,
    output tri1 id_10,
    output wor id_11,
    output wor id_12,
    input wire id_13,
    output tri0 id_14,
    output tri id_15,
    output wand id_16
);
  assign id_14 = ~1;
  parameter id_18 = &1'b0;
  wire id_19;
  assign id_15 = id_4;
  wire id_20;
  assign id_14 = 1'b0;
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    input tri0 id_2,
    inout tri id_3,
    input uwire id_4,
    output tri1 id_5,
    output supply1 id_6,
    input tri0 id_7,
    output tri0 id_8,
    id_11,
    input tri1 id_9
);
  wire id_12, id_13, id_14, id_15;
  wire id_16;
  module_0 modCall_1 (
      id_9,
      id_5,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_4,
      id_5,
      id_3,
      id_3,
      id_8,
      id_6,
      id_4,
      id_3,
      id_8,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
