// Seed: 1829973763
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    output uwire id_5
);
  supply0 id_7 = 1'd0;
  parameter id_8 = -1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output wor id_0,
    input  wor id_1
);
  parameter id_3 = -1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
  assign id_0 = id_3;
endmodule
module module_2 (
    input wor id_0,
    output tri id_1,
    input wor id_2,
    input wand id_3,
    input wand id_4,
    output uwire id_5,
    output supply1 id_6,
    output uwire id_7,
    output tri id_8,
    input supply0 id_9
);
  wire [-1 : 1  ^  1] id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_0,
      id_9,
      id_9,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
