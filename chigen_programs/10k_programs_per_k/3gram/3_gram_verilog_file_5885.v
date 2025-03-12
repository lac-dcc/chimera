// Seed: 4087617119
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    output supply0 id_2,
    output tri0 id_3,
    input wire id_4,
    input wire id_5,
    output supply0 id_6,
    output tri id_7,
    output wand id_8,
    input wor id_9,
    input wire id_10,
    input wor id_11,
    input wor id_12,
    input tri0 id_13,
    output supply0 id_14,
    input wand id_15,
    input supply0 id_16,
    input uwire id_17,
    input supply0 id_18,
    input supply1 id_19,
    input tri0 id_20,
    output tri1 id_21,
    output supply1 id_22,
    input tri id_23,
    output wire id_24,
    output tri id_25,
    output tri1 id_26,
    input wand id_27,
    input tri0 id_28,
    output supply1 id_29,
    output supply1 id_30,
    input tri1 id_31,
    output supply0 id_32,
    input tri id_33,
    output wire id_34,
    output tri id_35
);
  wire id_37;
  ;
  assign module_1.id_12 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd39,
    parameter id_4  = 32'd83
) (
    output wand id_0,
    input tri0 id_1,
    input wor id_2,
    input supply1 id_3,
    input wand _id_4,
    output wand id_5,
    input tri id_6,
    input wand id_7,
    input uwire id_8,
    output logic id_9,
    output supply0 id_10,
    output supply0 id_11,
    input tri _id_12
);
  assign id_9 = -1'b0;
  wire [1 : ~  -1] id_14;
  logic [7:0] id_15;
  ;
  always @(id_4 or negedge id_14) id_9 = id_14;
  assign id_15[1] = -1;
  wire id_16;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_11,
      id_8,
      id_8,
      id_11,
      id_5,
      id_11,
      id_2,
      id_8,
      id_2,
      id_3,
      id_2,
      id_11,
      id_3,
      id_6,
      id_2,
      id_3,
      id_2,
      id_7,
      id_10,
      id_10,
      id_8,
      id_10,
      id_11,
      id_11,
      id_1,
      id_1,
      id_11,
      id_0,
      id_3,
      id_5,
      id_2,
      id_10,
      id_10
  );
  wire [-1 : 1] id_17;
  logic [id_12 : id_4] id_18;
endmodule
