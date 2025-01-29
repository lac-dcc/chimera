// Seed: 3740220909
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output tri1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wire id_5,
    output tri0 id_6,
    input tri1 id_7,
    input wor id_8,
    output supply1 id_9,
    input supply0 id_10,
    id_18,
    output tri0 id_11,
    output supply1 id_12,
    input tri0 id_13,
    input tri id_14,
    output tri1 id_15,
    input tri0 id_16
);
  wire id_19;
  initial id_9 = -1;
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    input supply0 id_2,
    output wire id_3,
    input wire id_4,
    input tri0 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input wand id_8,
    output tri id_9,
    input tri1 id_10
);
  assign id_6 = id_7;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_7,
      id_7,
      id_6,
      id_6,
      id_8,
      id_10,
      id_6,
      id_10,
      id_9,
      id_6,
      id_4,
      id_4,
      id_9,
      id_10
  );
  assign modCall_1.id_6 = 0;
  wire id_12;
  wire id_13;
  and primCall (id_3, id_7, id_5, id_8, id_2, id_1, id_4);
  id_14(
      1, id_10
  );
endmodule
