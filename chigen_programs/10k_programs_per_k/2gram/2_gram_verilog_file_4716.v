// Seed: 4082898172
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output supply0 id_7;
  inout uwire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_7 = 1;
  wire id_8;
  assign id_6 = 1;
  wire id_9;
  assign #id_10 id_2 = 'b0 ==? id_4;
endmodule
macromodule module_1 #(
    parameter id_19 = 32'd3,
    parameter id_2  = 32'd19,
    parameter id_20 = 32'd70,
    parameter id_3  = 32'd68
) (
    id_1,
    _id_2,
    _id_3,
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
    _id_19,
    _id_20,
    id_21,
    id_22,
    id_23
);
  inout wire id_23;
  inout logic [7:0] id_22;
  input wire id_21;
  inout wire _id_20;
  inout wire _id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wand id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire _id_3;
  inout wire _id_2;
  output wire id_1;
  always begin : LABEL_0
    $unsigned(56);
    ;
  end
  assign id_22[1'b0 : 1] = id_19;
  logic [7:0][(  id_2  ) : id_20] id_24;
  initial begin : LABEL_1
    id_24[id_3 : id_19] <= -1;
  end
  module_0 modCall_1 (
      id_23,
      id_23,
      id_23,
      id_4,
      id_6,
      id_23,
      id_6
  );
  assign id_8 = {id_23, 1} - -1;
  logic id_25;
  ;
endmodule
