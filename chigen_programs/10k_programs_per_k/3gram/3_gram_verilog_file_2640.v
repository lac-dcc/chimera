// Seed: 4125777040
module module_0 (
    output supply0 id_0,
    output wor id_1,
    output tri0 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input wand id_5,
    input uwire id_6
);
  wire id_8;
  wire id_9;
  wire id_10;
  module_2 modCall_1 ();
  assign module_1.type_9 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    output tri0  id_3,
    output uwire id_4,
    input  tri0  id_5,
    inout  wor   id_6
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_2,
      id_3,
      id_2,
      id_1
  );
endmodule
module module_2;
  assign id_1 = 1;
  wire id_2;
  id_3 :
  assert property (@(id_2) id_3)
  else id_1 = #1  (1) * 1'b0;
  assign module_0.type_11 = 0;
endmodule
