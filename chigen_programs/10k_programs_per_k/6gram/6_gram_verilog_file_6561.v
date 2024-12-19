// Seed: 2275715808
module module_0 #(
    parameter id_26 = 32'd55,
    parameter id_27 = 32'd88
) (
    input wor id_0,
    input wor id_1,
    input supply1 id_2,
    input wor module_0,
    output wire id_4
    , id_20,
    input tri0 id_5,
    input tri1 id_6,
    output tri1 id_7,
    output wire id_8,
    output uwire id_9,
    output wand id_10,
    input wire id_11,
    input wire id_12,
    input uwire id_13,
    input wand id_14,
    output tri1 id_15
    , id_21, id_22,
    output tri id_16
    , id_23,
    input supply1 id_17,
    output tri0 id_18
);
  wire id_24;
  wire id_25;
  defparam id_26.id_27 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input supply0 id_2,
    output logic id_3,
    input logic id_4,
    output supply0 id_5,
    input wire id_6,
    input tri1 id_7
);
  wire id_9, id_10;
  assign id_3 = 1 & id_6;
  always id_3 = @(1'b0) id_4;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_1,
      id_1,
      id_5,
      id_7,
      id_6,
      id_5,
      id_0,
      id_5,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_5,
      id_5,
      id_2,
      id_5
  );
  assign modCall_1.id_8 = 0;
endmodule
