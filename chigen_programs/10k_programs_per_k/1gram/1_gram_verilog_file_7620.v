// Seed: 48472923
module module_0 ();
  tri0 id_1 = 1, id_2;
  wand id_4 = 1;
  wire id_5;
  wire id_6, id_7;
  assign id_2 = 1'b0;
  wire id_8;
  module_2 modCall_1 ();
  assign modCall_1.id_3 = 0;
  assign id_2 = 1;
endmodule
module module_1;
  reg id_1;
  reg id_2, id_3;
  module_0 modCall_1 ();
  assign modCall_1.type_9 = 0;
  wire id_4;
  id_5(
      id_3, id_1
  );
  always_ff id_1 <= id_2;
  assign id_3 = id_1;
endmodule
macromodule module_2;
  always id_1 <= 1;
  assign id_1 = (1);
  for (id_2 = id_1 - 1; 1; id_2 = id_2) supply0 id_3, id_4;
  assign id_4 = id_4 + 1;
endmodule
