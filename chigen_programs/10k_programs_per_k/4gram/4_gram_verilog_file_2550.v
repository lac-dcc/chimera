// Seed: 3728182361
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
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  inout logic [7:0] id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  localparam id_19 = 1, id_20 = 1, id_21 = -1'b0, id_22 = -1, id_23 = 1;
  wire id_24 = 1;
  assign id_17[~1] = -1 ? -1'b0 : id_4 ? id_16 : id_6;
  assign id_24 = id_21;
endmodule
module module_1 #(
    parameter id_1 = 32'd82
) (
    _id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout logic [7:0] id_2;
  input wire _id_1;
  generate
    logic [1 : id_1] id_4 = id_2[1'b0];
  endgenerate
  assign id_4 = !id_2;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_4,
      id_2,
      id_4
  );
  wire id_5 = id_1;
endmodule
