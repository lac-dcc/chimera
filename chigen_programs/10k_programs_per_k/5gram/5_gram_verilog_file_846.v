// Seed: 1588606656
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4,
    input tri id_5,
    input wand id_6,
    input supply1 id_7,
    output supply1 id_8,
    input wand id_9,
    input supply1 id_10,
    input supply0 id_11,
    output wor id_12,
    output wire id_13,
    input wand id_14,
    input tri id_15,
    output uwire id_16,
    output uwire id_17,
    input wand id_18
);
  always @(posedge id_11 or posedge id_2) id_0 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    output wor id_2
);
  assign id_2 = id_0 != id_0 ? 1 : id_0;
  module_0(
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0
  );
endmodule
