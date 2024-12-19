// Seed: 3907181808
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
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2  = id_8;
  assign id_10 = id_3;
  assign id_9  = id_11;
  always @(posedge id_3) id_7 = id_3;
  assign id_10 = (1 == id_8);
  always_comb #1 id_2 = id_9;
  wire id_13, id_14;
  wire id_15;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always_ff begin : LABEL_0
    id_6[1] = 1'b0;
  end
  wand id_7;
  tri  id_8 = 1;
  assign id_7 = id_1;
  assign id_1 = 1;
  wire id_9;
  wire id_10;
  assign id_5 = 1;
  assign id_8 = 1;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11,
      id_8,
      id_1,
      id_11,
      id_11,
      id_8
  );
  wire id_12;
endmodule
