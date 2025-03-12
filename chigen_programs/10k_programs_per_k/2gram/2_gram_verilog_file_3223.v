// Seed: 499823900
module module_0 (
    input wand id_0#(.id_8(-1)),
    output supply0 id_1,
    output wire id_2,
    input uwire id_3,
    input supply0 id_4,
    output uwire id_5,
    input supply1 id_6
);
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input uwire id_2,
    input tri1 id_3,
    output tri id_4,
    output tri id_5,
    input tri1 id_6,
    input wire id_7,
    input wire id_8,
    input supply0 id_9,
    input wire id_10,
    output tri1 id_11,
    input wor id_12,
    output uwire id_13,
    output wand id_14
);
  assign id_11 = id_3 - id_12;
  or primCall (id_14, id_12, id_6, id_9, id_3, id_1, id_10, id_8);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_6,
      id_9,
      id_4,
      id_7
  );
  assign modCall_1.id_3 = 0;
  wire id_16;
  wire id_17;
  assign id_4 = id_17;
  logic id_18;
  ;
endmodule
