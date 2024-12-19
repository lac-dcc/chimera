// Seed: 2013907637
module module_0 #(
    parameter id_6 = 32'd84,
    parameter id_7 = 32'd37
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  generate
    defparam id_6.id_7 = 1;
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
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_19(
      id_1
  );
  assign id_2 = "";
  module_0 modCall_1 (
      id_4,
      id_11,
      id_12,
      id_4,
      id_10
  );
  assign id_12 = id_12;
  nor primCall (id_3, id_4, id_18, id_12, id_6, id_14, id_15, id_13, id_2, id_11, id_19);
endmodule
