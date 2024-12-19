// Seed: 3577800093
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  uwire id_13;
  wire  id_14;
  assign module_1.id_5 = 0;
  wire id_15;
  wire id_16;
  assign id_13 = id_5 ==? id_9;
  id_17(
      .id_0(id_16), .id_1(), .id_2(id_3), .id_3(1 <= id_13)
  );
  assign id_13 = 'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = {1 - id_1, id_1 == 1, 1 ==? id_7, 1, 1, id_2, 1'b0};
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_3,
      id_6,
      id_4,
      id_5,
      id_5,
      id_3,
      id_6,
      id_4,
      id_3
  );
endmodule
