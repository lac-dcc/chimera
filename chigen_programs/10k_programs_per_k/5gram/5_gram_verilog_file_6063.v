// Seed: 3773485757
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input wor id_2,
    input wand module_0,
    input uwire id_4,
    output tri0 id_5,
    output tri1 id_6,
    output tri1 id_7,
    input supply0 id_8,
    output uwire id_9,
    output tri0 id_10,
    output wand id_11,
    input supply0 id_12,
    output wire id_13,
    input wand id_14,
    input tri1 id_15,
    input uwire id_16,
    input wand id_17,
    output tri0 id_18,
    input wand id_19,
    input wire id_20,
    input uwire id_21,
    output wand id_22
);
  assign id_9 = id_20;
  wire id_24;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input tri id_5,
    output tri id_6,
    output uwire id_7,
    output supply0 id_8,
    output supply1 id_9,
    input tri0 id_10
);
  assign id_8 = 1;
  and primCall (id_9, id_10, id_4, id_3, id_5, id_0);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_0,
      id_4,
      id_1,
      id_8,
      id_8,
      id_3,
      id_6,
      id_1,
      id_8,
      id_4,
      id_2,
      id_4,
      id_4,
      id_10,
      id_3,
      id_8,
      id_3,
      id_10,
      id_5,
      id_9
  );
endmodule
