// Seed: 2799735001
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_15;
  wire id_16;
  always begin
    $display(id_6[1], id_12, 1);
  end
  wire id_17;
endmodule
module module_1 #(
    parameter id_10 = 32'd39,
    parameter id_11 = 32'd12,
    parameter id_12 = 32'd26,
    parameter id_13 = 32'd86,
    parameter id_14 = 32'd94,
    parameter id_15 = 32'd39,
    parameter id_16 = 32'd95,
    parameter id_17 = 32'd70,
    parameter id_8  = 32'd34,
    parameter id_9  = 32'd78
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1[1] = 1;
  wire id_7;
  assign id_3 = id_1;
  always_latch begin
    id_6 <= 1;
  end
  defparam id_8 = 1, id_9 = 1'h0 ? 1 : 1'b0, id_10 = 1, id_11 = id_10, id_12 = id_10, id_13 = 1,
      id_14 = id_14, id_15 = 1, id_16 = id_5, id_17 = id_14;
  nor (
      id_1,
      id_13,
      id_6,
      id_5,
      id_7,
      id_11,
      id_4,
      id_12,
      id_9,
      id_14,
      id_16,
      id_17,
      id_10,
      id_8,
      id_15
  );
  module_0(
      id_2, id_2, id_7, id_7, id_4, id_1, id_7, id_4, id_7, id_7, id_7, id_7, id_2, id_7
  );
endmodule
