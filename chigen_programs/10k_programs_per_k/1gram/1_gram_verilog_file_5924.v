// Seed: 82780200
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output wire id_2,
    output uwire id_3,
    input wire id_4,
    input wor id_5,
    input supply1 id_6,
    output wor id_7,
    input supply0 id_8,
    input wand id_9,
    input wire id_10
);
  wire id_12;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output supply0 id_2
    , id_15,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    output tri id_6,
    input supply1 id_7,
    input supply0 id_8,
    output supply1 id_9,
    input tri id_10,
    input wor id_11,
    output tri1 id_12,
    output tri id_13
);
  assign id_12 = id_1 ? id_15[1] : id_1;
  assign id_12 = id_1 + ~^1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_12,
      id_13,
      id_4,
      id_4,
      id_7,
      id_5,
      id_1,
      id_10,
      id_1
  );
endmodule
