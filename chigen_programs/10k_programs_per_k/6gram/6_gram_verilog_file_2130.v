// Seed: 1008651739
module module_0 (
    input wand id_0,
    output tri1 id_1
    , id_12,
    input tri id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output wor id_6,
    input uwire id_7,
    input wand id_8,
    input uwire id_9,
    output wand id_10
);
  assign id_12[1] = id_5;
  assign id_10 = id_3;
endmodule
module module_1 (
    input supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input tri id_3,
    input wand id_4,
    input supply0 id_5,
    input wand id_6,
    output wire id_7
);
  assign id_7 = (1'd0);
  reg id_9, id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_6,
      id_6,
      id_6,
      id_5,
      id_7,
      id_5,
      id_2,
      id_5,
      id_1
  );
  assign modCall_1.id_2 = 0;
  initial id_11 = #1 1;
  supply1 id_12 = 1;
endmodule
