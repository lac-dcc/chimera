// Seed: 1872685756
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input wire id_2,
    output wire id_3,
    output wire id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri id_7,
    input wand id_8,
    input wire id_9,
    output supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply1 id_13
);
  wire id_15;
  assign id_3 = 1;
  wire id_16;
  assign id_4 = id_15;
endmodule
program module_1 (
    output uwire id_0,
    input wand id_1,
    output supply1 id_2
);
  supply0 id_4;
  assign id_4 = id_1;
  buf primCall (id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_2,
      id_2,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_0,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.type_6 = 0;
endprogram
