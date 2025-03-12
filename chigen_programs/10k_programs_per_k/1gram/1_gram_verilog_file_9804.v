// Seed: 871579869
program module_0 (
    id_1#(
        .id_2(id_3),
        .id_4(1'b0 != -1 & id_5),
        .id_6(id_7)
    ),
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_16;
  localparam id_17 = 1;
  assign id_16 = id_6;
  wire id_18;
endprogram
module module_1 #(
    parameter id_6 = 32'd59,
    parameter id_7 = 32'd63,
    parameter id_9 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8
);
  inout wire id_8;
  input wire _id_7;
  inout wire _id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_8,
      id_4,
      id_8,
      id_4,
      id_5,
      id_5,
      id_8
  );
  parameter id_9 = 1;
  assign id_5 = id_1[id_6 : 1][{id_7}][1];
  wire [id_9 : 1] id_10;
  wire [-1 'b0 : -1 'b0] id_11;
  wire [1 : -1] id_12;
endmodule
