// Seed: 3847310903
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_3;
  assign id_2 = !id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_4 = 32'd2,
    parameter id_5 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire _id_5;
  inout wire _id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_8 = id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_7
  );
  tri0 [id_4 : id_5] id_11, id_12;
  real id_13;
  always force id_11 = id_5 !== 1;
  always_latch @(posedge -1 & id_4);
  assign id_12 = -1;
  reg [1 'b0 : -1] id_14, id_15;
  assign id_12 = -1;
  id_16 :
  assert property (@(posedge id_12) id_4)
  else id_14 <= id_11;
endmodule
