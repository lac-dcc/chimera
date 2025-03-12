// Seed: 2820934047
module module_0 #(
    parameter id_3 = 32'd19
) (
    output tri0 id_0,
    output tri1 id_1,
    output supply0 id_2,
    output wand _id_3
);
  logic [{  id_3  ,  1  } : ""] id_5 = 1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_0  = 32'd55,
    parameter id_19 = 32'd70,
    parameter id_3  = 32'd18
) (
    output tri0 _id_0,
    output tri1 id_1,
    input tri id_2,
    input wire _id_3,
    input supply1 id_4,
    input supply1 id_5,
    input uwire id_6,
    input wor id_7,
    output tri1 id_8,
    input tri id_9,
    input tri id_10,
    input uwire id_11,
    output supply0 id_12,
    input wire id_13,
    output wand id_14,
    input wor id_15,
    output supply0 id_16,
    input supply1 id_17,
    input supply1 id_18,
    input wire _id_19,
    input wand id_20,
    input tri id_21,
    output supply1 id_22,
    output wor id_23,
    input wire id_24
);
  assign id_0 = id_18;
  initial begin : LABEL_0
    #id_26;
  end
  parameter id_27 = 1;
  struct packed {logic [id_19 : -1] id_28;} [id_0  .  id_3 : 1  ==  1 'd0] id_29;
  wire id_30;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_14,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
