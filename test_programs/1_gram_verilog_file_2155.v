// Seed: 3556164389
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input supply1 id_2
);
  wire id_4;
  wire id_5, id_6, id_7;
  assign id_4 = id_7;
  wor  id_8 = id_0;
  wire id_9;
  module_2 modCall_1 (
      id_0,
      id_8,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire id_10;
  id_11(
      id_5
  );
endmodule
module module_1 (
    input wire id_0
);
  wire id_2;
  wire id_3, id_4, id_5;
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0
  );
endmodule
module module_2 (
    input  tri  id_0,
    output wor  id_1,
    input  tri1 id_2
);
  assign id_1 = 1;
  wand id_4;
  \id_5 (
      .id_0(id_4), .id_1(-1)
  );
  always id_4 = -1 & ~|(id_0) - -1;
endmodule
