// Seed: 157181306
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(.id_9(1)),
    id_10,
    id_11
);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_12;
  assign module_1.type_9 = 0;
  wire id_13 = id_5, id_14;
  tri0 id_15, id_16, id_17 = -1, id_18, id_19, id_20;
  assign id_5 = id_3;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    input  wire  id_2,
    output tri0  id_3,
    input  tri0  id_4,
    output tri   id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  assign id_5 = id_2 < (id_1) ^ -1'd0;
endmodule
