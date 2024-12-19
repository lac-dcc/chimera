// Seed: 2610327080
module module_0 ();
  wire id_1;
  wire id_2;
  wire id_3, id_4;
  assign module_2.type_16 = 0;
  assign id_3 = id_1;
endmodule
module module_1 ();
  always_latch if (id_1);
  module_0 modCall_1 ();
  wire id_2;
  id_3(
      id_2, id_1, id_1, 1
  );
endmodule
module module_2 (
    input tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input wor id_3,
    output supply0 id_4,
    input wand id_5,
    output wand id_6,
    output tri id_7,
    output tri0 id_8
);
  id_10 :
  assert property (@(posedge id_10 - id_0 * id_3) 1) if (1'b0) id_6.id_5 = 1;
  assign id_7 = 1;
  wire id_11;
  module_0 modCall_1 ();
  wire id_12;
  wire id_13, id_14;
  supply0 id_15 = id_2;
endmodule
