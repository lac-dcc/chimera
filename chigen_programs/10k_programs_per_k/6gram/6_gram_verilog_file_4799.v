// Seed: 28115787
module module_0 #(
    parameter id_15 = 32'd17,
    parameter id_16 = 32'd46
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_14;
  defparam id_15.id_16 = (1);
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
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_18;
  assign id_13 = 1;
  assign id_16 = 1'b0;
  tri0 id_19 = {(!id_2), 1, id_1[1] == 1'b0, 1, 1, 1'b0, 1} ? 1'h0 : 1;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_7,
      id_5,
      id_10,
      id_3,
      id_4,
      id_9,
      id_16,
      id_2,
      id_19,
      id_18,
      id_19
  );
endmodule
