// Seed: 2633758421
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8;
endmodule
module module_1 #(
    parameter id_11 = 32'd81
) (
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
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  output wire id_3;
  inout reg id_2;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_5,
      id_1,
      id_8,
      id_9,
      id_6
  );
  output wire id_1;
  wire id_10;
  generate
    wire _id_11;
  endgenerate
  task automatic id_12(input id_13 id_14, output id_15);
    id_2 <= id_4[id_11];
  endtask
  wire [1 : -1] id_16;
endmodule
