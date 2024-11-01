// Seed: 1479437721
module module_0 #(
    parameter id_16 = 32'd25,
    parameter id_17 = 32'd96
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
    id_15
);
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_10 = 1'b0;
  generate
    defparam id_16.id_17 = 1;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0(
      id_8, id_6, id_6, id_2, id_7, id_5, id_6, id_7, id_4, id_4, id_4, id_8, id_6, id_4, id_3
  );
  wire id_9 = (id_9);
  wire id_10;
  assign id_4 = id_8;
endmodule
