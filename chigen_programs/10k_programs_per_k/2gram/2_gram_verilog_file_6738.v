// Seed: 3956175210
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_11;
  id_12(
      id_4, id_5, id_11, 1
  );
  assign module_1.id_6 = 0;
  assign id_9[1] = 1;
  assign id_3 = 1;
endmodule
module module_1 (
    input  wand  id_0,
    output wire  id_1,
    input  tri   id_2,
    output uwire id_3,
    input  uwire id_4
);
  wor id_6 = id_4 - 1;
  logic [7:0] id_7;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_6,
      id_9,
      id_6,
      id_6,
      id_6,
      id_9,
      id_7,
      id_8
  );
  id_10(
      .id_0(id_4),
      .id_1(1),
      .id_2(id_9),
      .id_3(1),
      .id_4(id_8),
      .id_5(id_2),
      .id_6({1, 1 - 1, 1'b0, id_4}),
      .id_7(1),
      .id_8(1),
      .id_9(id_7[1]),
      .id_10(id_1)
  );
  wire id_11;
endmodule
