// Seed: 1422557853
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  uwire id_10 = (1);
  assign module_1.id_8 = 0;
  wire id_11;
  integer id_12, id_13;
  wire id_14;
  assign id_12 = 1;
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
  output wire id_2;
  output wire id_1;
  tri0 id_7, id_8, id_9, id_10, id_11;
  wire id_12;
  assign id_10 = id_9;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_5,
      id_6,
      id_12,
      id_4,
      id_7,
      id_12
  );
  assign id_7 = 1;
  assign id_5 = id_3;
  tri1 id_13;
  assign id_13 = 1'b0 + (1) == 1;
  always @(negedge 1) id_1 = id_11;
  initial begin : LABEL_0
    id_1 = 1;
  end
endmodule
