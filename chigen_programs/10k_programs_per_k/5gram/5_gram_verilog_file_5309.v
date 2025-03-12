// Seed: 3027956539
module module_0 (
    output supply0 id_0,
    input tri id_1,
    output uwire id_2,
    output supply1 id_3,
    output tri0 id_4,
    input wand id_5,
    input tri id_6
);
  assign id_3 = 1'b0;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    input  wand id_0,
    output tri0 id_1
);
  wire id_3, id_4;
  nor primCall (id_1, id_4, id_0);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  uwire id_0
    , id_6,
    output tri   id_1,
    input  wire  id_2,
    input  tri1  id_3,
    input  tri1  id_4
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_3,
      id_4
  );
  logic id_7 = -1'b0;
endmodule
