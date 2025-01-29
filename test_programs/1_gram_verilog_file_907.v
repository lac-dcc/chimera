// Seed: 3625962257
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
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = -1'b0;
  wire id_14;
  wire id_15, id_16;
  assign module_1.type_15 = 0;
  always_ff id_11 <= 1;
endmodule
module module_1 (
    input  uwire id_0,
    output wand  id_1,
    input  tri0  id_2,
    input  tri   id_3,
    output logic id_4,
    input  wor   id_5,
    input  tri0  id_6,
    output tri   id_7
);
  tri  id_9 = -1;
  reg  id_10 = -1;
  wire id_11;
  assign id_4 = -1 && id_6;
  assign id_9 = (-1);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_9,
      id_9,
      id_11,
      id_11,
      id_9,
      id_9,
      id_11,
      id_10,
      id_9,
      id_9
  );
  assign id_9 = 1;
  always_comb begin : LABEL_0
    id_4 <= -1;
    if (1)
      assert (id_3) begin : LABEL_0
        id_10 = -1;
      end else id_10 <= -1'b0;
    id_9 += -1 - id_10;
  end
endmodule
