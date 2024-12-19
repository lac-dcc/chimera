// Seed: 3044552885
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input tri0 id_2,
    output uwire id_3,
    output wand id_4,
    input uwire id_5,
    input tri id_6,
    output tri1 id_7,
    input supply1 id_8
);
  assign id_7 = 1;
  assign module_1.type_8 = 0;
  assign id_3 = id_6;
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input wand id_2,
    output supply1 id_3,
    input wand id_4
);
  always_latch #1;
  assign id_3 = 1 == id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_0,
      id_1,
      id_0
  );
  id_6 :
  assert property (@(posedge id_0) 1)
  else;
endmodule
