// Seed: 2604802711
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output tri0 id_2,
    output tri id_3,
    input tri1 id_4,
    output tri0 id_5,
    input wor id_6,
    input wor id_7,
    output uwire id_8,
    input tri1 id_9,
    output wand id_10,
    input supply1 id_11,
    input tri1 id_12,
    output uwire id_13,
    input supply1 id_14
);
  assign module_1.type_6 = 0;
  wire id_16;
  wand id_17;
  assign id_3 = id_17;
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    output supply1 id_2,
    output uwire id_3,
    input tri1 id_4,
    output wire id_5,
    input wor id_6,
    output uwire id_7,
    input wor id_8,
    input uwire id_9,
    output wire id_10,
    output tri id_11,
    input wand id_12,
    input tri0 id_13,
    output wand id_14
);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_11,
      id_9,
      id_2,
      id_0,
      id_4,
      id_1,
      id_12,
      id_1,
      id_4,
      id_8,
      id_14,
      id_8
  );
  assign id_11 = (1);
  id_16(
      id_0, 1, {1'h0, 1}, (~id_6)
  );
  wire id_17, id_18, id_19;
endmodule
