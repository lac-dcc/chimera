// Seed: 1700857726
program module_0 #(
    parameter id_18 = 32'd5,
    parameter id_19 = 32'd58
) (
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
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always if (id_8) force id_2 = 1;
  defparam id_18 = id_8 - $display(
      id_12
  ) & id_2 | -1'b0, id_19 = 1'b0;
  logic [7:0][~  1 'b0] id_20;
  wire id_21;
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
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_20;
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_16 = id_2#(.id_20(1));
  module_0 modCall_1 (
      id_16,
      id_19,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6,
      id_16,
      id_16,
      id_9,
      id_6,
      id_5,
      id_11,
      id_19,
      id_17,
      id_2,
      id_20
  );
endmodule
