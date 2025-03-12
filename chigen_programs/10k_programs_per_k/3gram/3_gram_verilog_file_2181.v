// Seed: 1323797048
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  output wire id_21;
  input wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [1 'b0 : -1 'b0] id_23;
endmodule
module module_1 #(
    parameter id_2 = 32'd57,
    parameter id_3 = 32'd36,
    parameter id_4 = 32'd42
) (
    id_1,
    _id_2,
    _id_3,
    _id_4,
    id_5
);
  output wire id_5;
  inout wire _id_4;
  input wire _id_3;
  inout wire _id_2;
  output wire id_1;
  always @* begin : LABEL_0
    disable id_6;
  end
  uwire [1 : id_4  >>  id_2] id_7;
  wire [id_2 : 1] id_8;
  assign id_8 = id_4;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_8,
      id_7,
      id_7,
      id_8,
      id_7,
      id_8,
      id_7,
      id_7,
      id_5,
      id_8,
      id_8,
      id_8,
      id_1,
      id_1,
      id_8,
      id_7,
      id_7,
      id_8,
      id_8,
      id_8
  );
  assign id_7 = id_7 + -1;
  logic [{  id_4  ,  id_3  +  1  } : ""] id_9;
  ;
  wand id_10 = -1;
endmodule
