// Seed: 3308033099
module module_0 (
    input tri id_0,
    output uwire id_1,
    input uwire id_2,
    input supply0 id_3
    , id_17,
    input tri0 id_4,
    output tri1 id_5,
    input tri0 id_6,
    input uwire id_7,
    output wand id_8,
    output wor id_9,
    input supply1 id_10,
    output tri0 id_11,
    input supply0 id_12,
    output tri id_13,
    input wire id_14,
    output wire id_15
);
  assign id_11 = id_6;
  logic id_18;
endmodule
module module_1 #(
    parameter id_0  = 32'd10,
    parameter id_16 = 32'd94,
    parameter id_9  = 32'd98
) (
    input tri1 _id_0,
    input uwire id_1,
    output supply1 id_2,
    input uwire id_3,
    output wand id_4,
    input uwire id_5,
    output tri0 id_6,
    input tri0 id_7,
    input tri1 id_8,
    input wire _id_9,
    input supply1 id_10,
    input tri1 id_11,
    output uwire id_12,
    input supply0 id_13,
    input wor id_14,
    input wand id_15,
    input wor _id_16,
    input wire id_17,
    input supply0 id_18,
    input supply1 id_19,
    output wire id_20,
    output tri0 id_21,
    input tri id_22,
    input tri0 id_23,
    output supply0 id_24,
    output tri id_25,
    output tri0 id_26,
    input wand id_27,
    input tri id_28
);
  wire id_30;
  logic [id_9 : -1] id_31;
  ;
  logic [7:0][id_0 : id_16] id_32;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_28,
      id_22,
      id_15,
      id_21,
      id_15,
      id_19,
      id_24,
      id_20,
      id_1,
      id_2,
      id_28,
      id_4,
      id_15,
      id_20
  );
  assign modCall_1.id_2 = 0;
  assign id_32[-1] = id_1;
  assign id_25 = id_22;
  or primCall (
      id_20,
      id_11,
      id_30,
      id_1,
      id_31,
      id_3,
      id_17,
      id_14,
      id_23,
      id_22,
      id_19,
      id_7,
      id_13,
      id_5,
      id_28,
      id_15
  );
  always @(posedge id_28) begin : LABEL_0
    cover (1);
  end
endmodule
