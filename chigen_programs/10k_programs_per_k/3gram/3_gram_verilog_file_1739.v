// Seed: 3104035131
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wand id_2,
    output uwire id_3,
    output tri0 id_4,
    output tri1 id_5,
    input tri1 id_6,
    input wor id_7,
    input supply1 id_8,
    input tri0 id_9,
    input uwire id_10,
    input wire id_11,
    input wor id_12,
    input tri1 id_13,
    output wand id_14,
    output wor id_15,
    input supply0 id_16,
    input tri0 id_17,
    input supply0 id_18
);
  assign id_3 = -1;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    output tri id_2,
    output tri id_3,
    output supply0 id_4
);
  always @(*) assign id_2 = id_1;
  not primCall (id_0, id_1);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_4,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
endmodule
