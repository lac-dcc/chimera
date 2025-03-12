// Seed: 774506767
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wire id_3,
    input tri1 id_4,
    input tri id_5,
    input supply1 id_6,
    input wire id_7,
    output wor id_8,
    input wor id_9,
    input tri1 id_10,
    input tri1 id_11,
    input wand id_12
);
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    input wand id_2,
    output supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    output tri1 id_6,
    output wire id_7
);
  assign id_0 = id_5 == 1'd0;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_4,
      id_4,
      id_5,
      id_5,
      id_3,
      id_5,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
