// Seed: 3386184677
module module_0 (
    output wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input tri0 id_3,
    output uwire id_4,
    output tri id_5,
    input supply1 id_6,
    input supply1 id_7,
    output tri1 id_8,
    output supply0 id_9,
    input wire id_10,
    input wor id_11,
    output tri0 id_12
);
  assign id_4 = -1;
endmodule
module module_0 #(
    parameter id_24 = 32'd98
) (
    input tri1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    output logic id_3,
    input supply1 id_4,
    input supply0 id_5,
    output tri module_1,
    output wor id_7,
    output uwire id_8,
    input tri id_9,
    input tri id_10,
    input tri0 id_11,
    output wire id_12,
    output wire id_13,
    output tri1 id_14,
    output wand id_15,
    input tri0 id_16,
    input wand id_17,
    input tri0 id_18
    , id_33,
    input wor id_19,
    input wire id_20,
    output supply0 id_21,
    input wand id_22,
    input uwire id_23,
    input uwire _id_24,
    input supply0 id_25,
    input supply1 id_26,
    input tri id_27,
    input tri id_28,
    input supply0 id_29,
    input wand id_30,
    input supply1 id_31
);
  wire [1 : id_24] id_34;
  wire id_35;
  wire id_36;
  parameter id_37 = -1;
  module_0 modCall_1 (
      id_14,
      id_28,
      id_4,
      id_22,
      id_7,
      id_14,
      id_9,
      id_17,
      id_13,
      id_12,
      id_27,
      id_16,
      id_7
  );
  assign modCall_1.id_4 = 0;
  always @(posedge id_11 or id_10) id_3 = #1 id_31 != id_5;
endmodule
