// Seed: 748868928
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
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
    id_17
);
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  tri0 id_18 = 1;
  generate
    wand id_19, id_20;
  endgenerate
  assign id_4 = id_8;
  uwire id_21;
  module_0 modCall_1 (
      id_21,
      id_6,
      id_7,
      id_8
  );
  wire  id_22;
  uwire id_23;
  assign id_10 = id_20 ** id_21;
  always @(1 - id_13 or posedge 1) begin : LABEL_0
    id_16 <= id_2;
  end
  wor  id_24 = 1;
  wire id_25;
  assign id_10 = !id_23;
endmodule
