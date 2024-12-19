// Seed: 2742941907
module module_0 #(
    parameter id_16 = 32'd7,
    parameter id_17 = 32'd74
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
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  uwire id_14;
  wand  id_15 = 1'b0;
  assign module_1.id_16 = 0;
  defparam id_16.id_17 = id_14;
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
    id_19
);
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  nand primCall (
      id_14, id_16, id_9, id_15, id_8, id_4, id_7, id_10, id_17, id_2, id_6, id_3, id_18
  );
  always @(posedge 1'b0 or id_8) id_16 <= id_2;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_5,
      id_10,
      id_3,
      id_4,
      id_9,
      id_19,
      id_3,
      id_15,
      id_14,
      id_14
  );
endmodule
