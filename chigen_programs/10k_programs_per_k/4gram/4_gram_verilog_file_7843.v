// Seed: 2338564559
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input uwire id_2,
    input tri0 id_3,
    input tri id_4
    , id_13,
    output tri1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input tri1 id_8
    , id_14,
    input wire id_9,
    input supply1 id_10,
    input tri id_11
);
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input tri id_3,
    input wire id_4,
    input wire id_5,
    output tri1 id_6,
    output supply1 id_7,
    input supply0 id_8,
    output tri1 id_9,
    output supply1 id_10,
    output uwire id_11
);
  assign id_10 = 1'h0;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_1,
      id_11,
      id_5,
      id_7,
      id_1,
      id_8,
      id_3,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
