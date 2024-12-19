// Seed: 1945703378
module module_0 (
    input tri id_0,
    output tri1 id_1,
    output uwire id_2,
    input wor id_3,
    output supply1 id_4,
    input wor id_5,
    output tri1 id_6,
    input uwire id_7
);
  tri id_9 = 1;
  tri id_10 = id_0;
  assign id_9 = id_10;
  wor id_11;
  string id_12;
  id_13(
      .id_0(id_7), .id_1(1 ? 1'b0 : id_2), .id_2(id_12), .id_3(1)
  );
  assign id_12 = "";
  assign id_11 = 1'b0;
endmodule
module module_1 (
    output supply0 id_0,
    output uwire id_1,
    output wire id_2,
    input tri0 id_3,
    output wor id_4,
    input wand id_5,
    input wor id_6
);
  id_8(
      .id_0(1), .id_1(""), .id_2(id_0), .id_3(1), .id_4(1), .id_5(1), .id_6(id_1)
  );
  wire id_9, id_10;
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_6,
      id_4,
      id_5,
      id_0,
      id_5
  );
  assign modCall_1.id_7 = 0;
endmodule
