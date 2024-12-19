// Seed: 2238648543
module module_0;
  wire id_1;
  wire id_2;
  assign module_2.id_5 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4
);
  assign id_1 = 1;
  notif1 primCall (id_0, id_3, id_4);
  module_0 modCall_1 ();
endmodule
module module_2 (
    input supply1 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri0 id_3,
    input supply0 id_4,
    input uwire id_5,
    output supply1 id_6
);
  module_0 modCall_1 ();
  assign id_6 = 1'h0;
  nand primCall (id_2, id_3, id_4, id_5);
endmodule
