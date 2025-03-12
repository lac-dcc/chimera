// Seed: 2627578568
module module_0 (
    output uwire id_0,
    output wor id_1,
    output tri1 id_2,
    input tri1 id_3,
    input tri id_4,
    input wor id_5,
    input tri1 id_6,
    input uwire module_0,
    output tri1 id_8,
    output uwire id_9,
    input tri0 id_10,
    input supply1 id_11,
    output tri id_12,
    input tri id_13,
    input supply0 id_14,
    output wor id_15,
    input tri0 id_16,
    input supply1 id_17,
    output tri id_18,
    input tri id_19,
    input wor id_20,
    output tri0 id_21,
    output tri id_22,
    output tri1 id_23,
    output tri1 id_24,
    input wire id_25,
    input wor id_26,
    output wor id_27,
    input supply0 id_28,
    output wand id_29
);
endmodule
module module_1 #(
    parameter id_0  = 32'd8,
    parameter id_12 = 32'd95,
    parameter id_17 = 32'd99,
    parameter id_2  = 32'd62,
    parameter id_26 = 32'd97,
    parameter id_29 = 32'd83
) (
    input tri1 _id_0,
    output logic id_1,
    input wand _id_2,
    output wire id_3,
    output wand id_4,
    input wand id_5,
    input tri0 id_6,
    output wor id_7,
    input supply0 id_8,
    output wand id_9,
    output tri1 id_10,
    output tri1 id_11,
    output wor _id_12,
    output uwire id_13,
    input wor id_14,
    output wor id_15,
    input supply0 id_16,
    input supply1 _id_17,
    output supply0 id_18,
    output supply0 id_19
);
  always_comb @(negedge 1) begin : LABEL_0
    id_1 <= 1;
  end
  wire [id_0 : id_17] id_21, id_22, id_23, id_24, id_25, _id_26, id_27, id_28, _id_29;
  wire id_30;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_15,
      id_5,
      id_14,
      id_8,
      id_16,
      id_16,
      id_10,
      id_9,
      id_8,
      id_14,
      id_3,
      id_8,
      id_6,
      id_9,
      id_16,
      id_5,
      id_13,
      id_5,
      id_14,
      id_18,
      id_4,
      id_4,
      id_3,
      id_5,
      id_14,
      id_18,
      id_5,
      id_13
  );
  assign modCall_1.id_6 = 0;
  assign id_18 = -1;
  wire id_31;
  assign id_9 = 1;
  logic [1 : 1] id_32;
  ;
  logic [-1  &&  id_12 : 1] id_33;
  wire [id_26  &&  id_2 : id_29] id_34;
  logic id_35;
  ;
  parameter id_36 = -1;
endmodule
