// Seed: 288560432
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    output tri1 id_2
);
  wire id_4;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input uwire id_0,
    output wor id_1,
    input wor id_2,
    output uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri id_6,
    output tri id_7,
    input uwire id_8,
    input uwire id_9
);
  assign id_3 = 1;
  or primCall (id_1, id_8, id_6, id_4, id_2, id_0, id_9);
  module_0 modCall_1 (
      id_7,
      id_3,
      id_1
  );
  assign modCall_1.type_5 = 0;
endmodule
module module_2;
  wor  id_2;
  tri1 id_3;
  assign id_3 = 1'h0;
  assign id_1 = 1 == id_2 && !1;
  wire id_4;
  assign id_2 = id_1;
endmodule
