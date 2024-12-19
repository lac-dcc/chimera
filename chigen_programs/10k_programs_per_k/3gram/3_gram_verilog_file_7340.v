// Seed: 2120461539
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor id_4,
    output tri0 id_5,
    input uwire id_6
);
  module_2 modCall_1 ();
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2;
  wire id_2;
  wire id_3;
  assign module_3.id_2 = 0;
endmodule
module module_3 (
    input supply0 id_0,
    input wor id_1,
    input uwire id_2
);
  assign id_4 = id_0;
  module_2 modCall_1 ();
endmodule
