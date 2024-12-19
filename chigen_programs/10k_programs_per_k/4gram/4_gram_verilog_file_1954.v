// Seed: 735334860
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wor id_2
    , id_12,
    input wor id_3,
    output supply0 id_4,
    output tri id_5,
    input tri0 id_6,
    input uwire id_7,
    output wor id_8,
    output wor id_9,
    output tri1 id_10
);
  id_13 :
  assert property (@(negedge ~id_12) 1'b0)
  else $display(id_7, 1, id_6, id_0, id_12);
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input wand id_2,
    output tri0 id_3,
    output wor id_4,
    output wire id_5
);
  assign id_0 = 1;
  assign id_3 = 1'b0;
  integer id_7, id_8;
  wire id_9;
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_1,
      id_1,
      id_3,
      id_5,
      id_10,
      id_10,
      id_0,
      id_10,
      id_10
  );
  assign id_0 = id_10;
  wire id_12 = 1;
endmodule
