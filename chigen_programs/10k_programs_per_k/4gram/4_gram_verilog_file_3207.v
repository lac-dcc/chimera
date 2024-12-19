// Seed: 3495149652
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input supply1 id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output supply0 id_6,
    input tri0 id_7
);
  wire id_9;
endmodule
module module_1 (
    output wire id_0,
    output supply0 id_1,
    output supply1 id_2
);
  supply0 id_4;
  assign id_2 = id_4;
  supply1 id_5, id_6;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_4 = 0;
  uwire id_7;
  uwire id_8 = 1'b0;
  id_9(
      .id_0(id_4), .id_1(id_1), .id_2(1 != id_8)
  );
  tri  id_10;
  wire id_11;
  assign id_5 = 1;
  assign id_8 = 1'b0;
  tri id_12 = id_8;
endmodule
