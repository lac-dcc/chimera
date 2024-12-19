// Seed: 120200118
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4 = (id_2);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  wire  id_1,
    output wand  id_2,
    output uwire id_3,
    output uwire id_4,
    input  wire  id_5
);
  wire  id_7;
  uwire id_8 = (id_5);
  id_9 :
  assert property (@(negedge id_5) id_8)
  else $display(1, 1, 1);
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7
  );
endmodule
