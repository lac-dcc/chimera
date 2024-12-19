// Seed: 1221009934
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2[1] = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    input  tri   id_0,
    output tri0  id_1,
    output uwire id_2,
    input  tri   id_3,
    output tri0  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  tri1  id_7,
    output wire  id_8,
    output tri0  id_9,
    input  wire  id_10,
    output uwire id_11,
    output tri0  id_12,
    input  tri1  id_13,
    input  tri0  id_14,
    input  uwire id_15
);
  wire id_17;
  nor primCall (id_2, id_6, id_5, id_10, id_14, id_17, id_7, id_15, id_0);
  module_0 modCall_1 (
      id_17,
      id_17,
      id_17
  );
endmodule
