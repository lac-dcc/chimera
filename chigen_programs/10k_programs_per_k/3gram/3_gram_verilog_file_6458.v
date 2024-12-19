// Seed: 1256736227
module module_0 (
    output uwire id_0,
    input  wand  id_1,
    input  tri0  id_2
);
  string id_4 = "", id_5, id_6, id_7, id_8;
  wor id_9;
  logic [7:0] id_10;
  assign id_7 = id_10[1];
  assign id_9 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output supply0 id_2,
    output supply0 id_3,
    input wor id_4,
    input uwire id_5,
    output supply1 id_6,
    output wor id_7,
    output tri id_8,
    input supply0 id_9
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_5
  );
  assign modCall_1.id_5 = "";
  id_11(
      .id_0(id_7), .id_1(1), .id_2(id_2), .id_3(""), .id_4(id_2)
  );
endmodule
