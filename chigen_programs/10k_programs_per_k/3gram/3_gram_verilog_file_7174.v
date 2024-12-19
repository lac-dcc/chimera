// Seed: 241697761
module module_0 (
    input wand id_0,
    output tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri1 id_4
);
  wire id_6 = 1;
  assign module_2.type_16 = 0;
  genvar id_7;
  assign id_1 = id_7;
endmodule
macromodule module_1 (
    output tri   id_0,
    input  tri1  id_1,
    input  uwire id_2
);
  id_4 :
  assert property (@(posedge 1) 1)
  else id_4 = id_1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    input wand id_0,
    output supply1 id_1,
    output supply0 id_2,
    input wire id_3,
    output tri id_4
);
  wire id_6;
  wand id_7;
  assign id_1 = 1;
  uwire id_8 = id_6;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_3
  );
  wire id_9;
  id_10 :
  assert property (@(negedge id_3) id_7#(.id_7(id_6)) * 1'b0)
  else id_2 = 1;
endmodule
