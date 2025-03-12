// Seed: 3101611249
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output supply1 id_2,
    output wire id_3,
    output wire id_4,
    output wor id_5,
    output tri0 id_6,
    output tri id_7,
    output supply1 id_8,
    input uwire id_9,
    input tri id_10,
    input wire id_11,
    input uwire id_12,
    input wand id_13,
    input wand id_14,
    input tri id_15,
    input wor id_16,
    output tri id_17,
    output tri id_18,
    output wor id_19,
    output uwire id_20,
    input supply0 id_21,
    input wire id_22,
    input tri id_23,
    output supply1 id_24,
    input uwire id_25,
    output wire id_26,
    input tri id_27,
    input uwire id_28,
    output tri0 id_29
);
  wire id_31;
  always @*;
  logic id_32;
  ;
endmodule
macromodule module_1 #(
    parameter id_6 = 32'd17
) (
    output wor id_0,
    output tri0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input supply0 id_5,
    input tri1 _id_6
);
  logic id_8;
  ;
  initial @(posedge id_8 or posedge -1'b0 & id_6);
  logic [id_6 : 1 'b0] id_9;
  logic id_10;
  wire id_11;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_5,
      id_5,
      id_3,
      id_4,
      id_3,
      id_3,
      id_5,
      id_4,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_5,
      id_3,
      id_0,
      id_3,
      id_0,
      id_4,
      id_4,
      id_1
  );
  assign modCall_1.id_16 = 0;
endmodule
