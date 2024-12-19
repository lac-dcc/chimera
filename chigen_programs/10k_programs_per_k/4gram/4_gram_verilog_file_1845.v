// Seed: 2397686726
module module_0 #(
    parameter id_8 = 32'd97,
    parameter id_9 = 32'd99
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  defparam id_8.id_9 = 1'b0;
  assign id_1[1] = 1;
endmodule
module module_1 #(
    parameter id_14 = 32'd81,
    parameter id_15 = 32'd30
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_5 = 1;
  logic [7:0] id_7;
  wire id_8;
  initial begin : LABEL_0
    id_2 <= id_7[1'h0==1];
  end
  wire id_9, id_10;
  wire id_11;
  assign id_3[1 : 1] = id_10;
  wire id_12;
  wire id_13;
  defparam id_14.id_15 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_12,
      id_4,
      id_6,
      id_9,
      id_4,
      id_13
  );
  assign modCall_1.id_9 = 0;
endmodule
