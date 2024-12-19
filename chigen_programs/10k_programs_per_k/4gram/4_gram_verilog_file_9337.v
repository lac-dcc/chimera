// Seed: 2890915787
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    output tri0 id_0,
    output wand id_1,
    output wire id_2,
    input  tri0 id_3,
    input  wor  id_4
);
  wire id_6;
  wire id_7;
  wire id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  wire id_21;
  id_22(
      .id_0(id_6), .id_1(1)
  );
  module_0 modCall_1 (
      id_9,
      id_10,
      id_8,
      id_19,
      id_9
  );
endmodule
