// Seed: 4035992202
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  assign module_1.id_0 = 0;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output logic id_2
    , id_4
);
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5,
      id_4,
      id_6,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5,
      id_6,
      id_5
  );
  always @(posedge 1) begin : LABEL_0
    if (1) id_2 <= |id_6;
  end
  nand primCall (id_2, id_6, id_0, id_1);
  assign id_4 = -1;
endmodule
