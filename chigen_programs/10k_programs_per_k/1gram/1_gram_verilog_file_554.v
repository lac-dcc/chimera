// Seed: 2795984421
module module_0 (
    input  uwire id_0,
    output tri0  id_1,
    input  tri1  id_2,
    input  wire  id_3,
    input  uwire id_4,
    output uwire id_5,
    input  wor   id_6
);
  xor (id_5, id_4, id_0, id_3, id_2);
  assign id_1 = id_6;
  module_2(
      id_5, id_5, id_6
  );
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output uwire id_2
);
  module_0(
      id_0, id_2, id_1, id_0, id_1, id_2, id_1
  );
endmodule
module module_2 (
    output tri0 id_0,
    output tri  id_1,
    input  tri1 id_2
);
  wire id_4;
  wire id_5;
endmodule
module module_3 (
    output uwire id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input tri id_5,
    output wor id_6
);
  supply1 id_8 = id_4, id_9;
  assign id_0 = id_4;
  wire id_10;
  module_2(
      id_6, id_0, id_4
  );
endmodule
