// Seed: 239417906
module module_0 (
    output wor  id_0,
    input  tri  id_1,
    input  wire id_2
);
  assign id_0 = 1;
endmodule
module module_1 (
    input  tri   id_0,
    output uwire id_1,
    output uwire id_2,
    output wand  id_3,
    input  wand  id_4,
    output tri   id_5
);
  assign id_5 = 1;
  or primCall (id_5, id_4, id_0);
  if (id_4) begin : LABEL_0
    wor id_7 = id_4;
  end else assign id_5 = id_4;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_7
  );
  assign modCall_1.type_5 = 0;
  assign id_2 = 1;
endmodule
module module_2 (
    input  wand id_0,
    output tri  id_1
);
  id_3(
      .id_0(id_0), .id_1(id_4), .id_2(id_0), .id_3(id_1)
  );
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0
  );
endmodule
