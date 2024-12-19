// Seed: 126455714
module module_0 (
    input tri id_0,
    input uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    input wand id_4,
    output uwire id_5,
    input uwire id_6,
    input wire id_7
);
  initial id_5 = id_0;
  tri0 id_9 = 1, id_10;
endmodule
module module_1 (
    input  wand  id_0,
    input  wire  id_1,
    output uwire id_2
);
  wire id_4;
  id_5(
      .id_0(1), .id_1(id_2), .id_2(1'h0 ^ id_0)
  );
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.type_11 = 0;
endmodule
