// Seed: 910070677
module module_0 (
    output wor id_0
    , id_6,
    input tri id_1,
    output wire id_2,
    input supply1 id_3,
    input tri1 id_4
);
  wire id_7;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.type_2 = 0;
endmodule
module module_1 (
    output wire id_0,
    input  wire id_1,
    input  wand id_2
);
  wire id_4, id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.type_11 = 0;
endmodule
module module_2 (
    input  tri  id_0,
    input  tri0 id_1,
    output wand id_2
);
  generate
    wire id_4;
  endgenerate
  assign module_3.id_3 = 0;
endmodule
module module_3 (
    output wor id_0,
    output supply0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wand id_4,
    output supply0 id_5
);
  assign id_1 = 1;
  tri id_7;
  wire id_8;
  supply0 id_9 = 1;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_1
  );
  wire id_10;
  id_11 :
  assert property (@(negedge id_7) id_3)
  else $display(id_11);
  wire id_12 = id_8;
  wire id_13;
endmodule
