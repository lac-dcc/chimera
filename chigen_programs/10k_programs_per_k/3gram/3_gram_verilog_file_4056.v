// Seed: 1052912759
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
    id_16
);
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd13,
    parameter id_5 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout logic [7:0] id_6;
  inout wire _id_5;
  inout wire _id_4;
  output logic [7:0] id_3;
  output wire id_2;
  output tri id_1;
  localparam [id_4 : id_5] id_8 = 1;
  assign id_3[-1'b0] = id_7;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_8,
      id_8,
      id_8,
      id_7,
      id_8,
      id_2,
      id_8,
      id_8,
      id_2,
      id_8,
      id_8,
      id_8,
      id_1
  );
  assign id_6[1] = 1;
  assign id_1 = 1;
endmodule
