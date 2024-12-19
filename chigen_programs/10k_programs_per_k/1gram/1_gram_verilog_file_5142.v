// Seed: 1276275724
module module_0 (
    inout uwire id_0,
    output wand id_1,
    input tri1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wand id_5
);
  wire id_7, id_8, id_9;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri id_3,
    input supply1 id_4,
    output wor id_5
);
  tri id_7, id_8 = id_1;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_4,
      id_1,
      id_7,
      id_4
  );
  assign modCall_1.type_11 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    input wire id_1,
    input wire id_2,
    input uwire id_3,
    input wand id_4
);
  assign id_6 = id_4;
  always_ff
    if (1 - 1) id_6 = 1'h0;
    else;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.type_2 = 0;
  wire id_7;
endmodule
