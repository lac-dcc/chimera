// Seed: 2950725590
module module_0 (
    output wand id_0,
    output wand id_1,
    input  tri1 id_2,
    output tri0 id_3
);
endmodule
module module_1 (
    output wire id_0,
    input  tri1 id_1
);
  parameter id_3 = !1;
  assign id_0 = id_3;
  logic id_4;
  wire  id_5;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output logic id_0,
    output supply1 id_1,
    input tri0 id_2,
    input uwire id_3,
    output wire id_4
);
  always repeat (id_2) id_0 = #id_6 -1'b0 == id_6;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
  wand id_7 = 1;
  id_8 :
  assert property (@(posedge id_8 == id_6 - 1 - ~id_2) -1)
  else $unsigned(62);
  ;
endmodule
