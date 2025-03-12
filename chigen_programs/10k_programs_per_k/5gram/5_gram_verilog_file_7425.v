// Seed: 2008671997
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_10 = id_1;
endmodule
module module_1 #(
    parameter id_1  = 32'd63,
    parameter id_10 = 32'd18
) (
    input uwire id_0,
    input tri1 _id_1,
    input wand id_2,
    output wand id_3,
    input tri1 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wor id_8,
    output supply0 id_9,
    input uwire _id_10,
    input tri0 id_11,
    input wand id_12,
    output supply0 id_13,
    input tri0 id_14,
    input wire id_15,
    input wand id_16,
    input wire id_17,
    input uwire id_18,
    output logic id_19
);
  wire [id_1 : 1  !=?  1] id_21;
  wire [1 'b0 : id_10] id_22;
  always id_19 <= #1  !id_21;
  logic id_23;
  ;
  module_0 modCall_1 (
      id_23,
      id_21,
      id_21,
      id_21,
      id_21,
      id_21,
      id_23,
      id_21,
      id_23
  );
  assign id_23 = -1;
endmodule
