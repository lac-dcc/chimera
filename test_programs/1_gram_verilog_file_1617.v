// Seed: 420781710
module module_0 (
    output tri id_0,
    input tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    output wire id_4,
    input wire id_5
);
  wire id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14;
  assign module_1.id_0 = 0;
  assign id_13 = id_14;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    input  tri   id_2,
    output wand  id_3
);
  wire id_5;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_1
  );
  assign id_0 = -1;
  pullup (.id_0(id_1 ? -1 : id_3), .id_1(id_2), .id_2(1'b0), .id_3(id_0), .id_4(id_0));
endmodule
