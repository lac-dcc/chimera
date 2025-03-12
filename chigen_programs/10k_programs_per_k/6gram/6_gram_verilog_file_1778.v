// Seed: 1033527
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
  input wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_15 = 1;
  assign module_1.id_9 = 0;
  wire id_16;
  assign id_10 = id_5;
endmodule
module module_1 #(
    parameter id_9 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  input wire _id_9;
  inout wire id_8;
  inout logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_6,
      id_1,
      id_4,
      id_5,
      id_8,
      id_6,
      id_8,
      id_8,
      id_1,
      id_8,
      id_4,
      id_4
  );
  input wire id_1;
  assign id_8 = id_2 && 1 == 1 ? 1 : id_7[1'b0 : (id_9)] ~^ id_4;
endmodule
