// Seed: 3389779467
module module_0 (
    output wor id_0,
    input tri0 id_1,
    output tri1 id_2,
    output supply0 id_3,
    output uwire id_4,
    input wor id_5,
    input uwire id_6,
    output tri0 id_7,
    input uwire id_8,
    output wor id_9
);
  wire id_11;
  ;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input wor id_0,
    output wand id_1,
    input tri1 id_2,
    output wand id_3,
    input tri id_4,
    output wor id_5,
    input tri0 id_6,
    input tri1 id_7,
    output wand id_8,
    output tri0 id_9,
    input supply0 id_10,
    output tri0 id_11,
    output uwire id_12
);
  assign id_11 = 1;
  module_0 modCall_1 (
      id_11,
      id_7,
      id_8,
      id_5,
      id_11,
      id_4,
      id_7,
      id_12,
      id_10,
      id_8
  );
  assign id_3 = id_7 ? 1'd0 : 1'd0;
endmodule
