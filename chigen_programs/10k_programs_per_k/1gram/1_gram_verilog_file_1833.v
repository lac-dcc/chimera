// Seed: 1773147846
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri1 id_3,
    output wire id_4,
    input tri0 id_5,
    input uwire id_6
);
  assign id_0 = 1 - 1;
  wire id_8, id_9, id_10, id_11, id_12;
endmodule
module module_1 (
    output wand id_0,
    output supply1 id_1,
    input supply1 id_2
);
  supply0 id_4;
  assign id_4 = 1'h0;
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2
  );
  assign modCall_1.type_2 = 0;
endmodule
