// Seed: 2014933035
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
  inout wand id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output tri id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = id_16 == id_5;
  localparam id_17 = 1, id_18 = -1;
  assign id_16 = id_14 - 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd67
) (
    id_1,
    _id_2,
    id_3
);
  inout wire id_3;
  output wire _id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3
  );
  logic [(  1  )  ==  id_2 : 1 'b0] id_4 = 1'h0;
endmodule
