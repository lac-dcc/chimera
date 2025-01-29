// Seed: 4088143892
module module_0 (
    input  tri0  id_0,
    output uwire id_1,
    input  wire  id_2,
    input  uwire id_3,
    input  wire  id_4,
    input  tri0  id_5,
    input  uwire id_6,
    output uwire id_7,
    input  tri0  id_8#(.id_24(1'b0)),
    input  uwire id_9,
    input  tri0  id_10,
    input  tri   id_11,
    output wire  id_12,
    input  tri   id_13,
    output tri0  id_14,
    input  tri1  id_15,
    input  wand  id_16,
    input  tri0  id_17,
    input  wor   id_18,
    output tri0  id_19,
    input  wor   id_20,
    input  uwire id_21,
    input  tri1  id_22
);
  generate
    wire id_25;
  endgenerate
  wire id_26;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1,
    output wand  id_2,
    id_4
);
  always id_2 = id_1;
  assign id_0 = id_4;
  wire id_5;
  assign id_4 = -1;
  always id_2 = -1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1
  );
  always id_4 <= "";
  localparam id_6 = id_6;
endmodule
