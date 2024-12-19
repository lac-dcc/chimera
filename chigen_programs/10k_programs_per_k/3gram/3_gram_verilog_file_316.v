// Seed: 1509341972
module module_0 (
    output uwire id_0,
    input tri id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4
    , id_19,
    output wire id_5,
    output uwire id_6,
    input supply1 id_7,
    output uwire id_8,
    input wand id_9,
    output tri1 id_10,
    input tri1 id_11,
    input supply0 id_12,
    output uwire id_13,
    input wand id_14,
    output tri1 id_15,
    input tri1 id_16,
    input tri1 id_17
);
  assign id_19 = 1;
  supply0 id_20;
  always @(posedge id_7 || 1 == id_1) id_20 = id_2;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    output supply0 id_4
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2,
      id_4,
      id_1,
      id_2,
      id_0,
      id_1,
      id_4,
      id_1,
      id_2
  );
endmodule
