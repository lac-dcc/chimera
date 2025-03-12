// Seed: 1548729605
module module_0 (
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
  output wire id_6;
  assign module_1.id_9 = 0;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_5 = 32'd79,
    parameter id_6 = 32'd84
) (
    input tri id_0,
    input supply0 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input supply0 _id_5,
    input tri0 _id_6,
    output wor id_7,
    output wor id_8,
    input supply0 id_9,
    output wand id_10,
    output wand id_11,
    input tri0 id_12
    , id_16,
    input tri0 id_13,
    output supply0 id_14
);
  wire [id_5  +  id_6 : id_6  &&  1] id_17;
  wire id_18;
  wire id_19 = id_4;
  logic id_20;
  logic [7:0] id_21;
  module_0 modCall_1 (
      id_19,
      id_19,
      id_17,
      id_18,
      id_20,
      id_20,
      id_18,
      id_17
  );
  assign id_16 = {1} == id_18 - -1;
  assign id_8  = id_21;
  logic id_22, id_23, id_24, id_25;
  always @(id_3) id_21[-1] <= id_16;
endmodule
