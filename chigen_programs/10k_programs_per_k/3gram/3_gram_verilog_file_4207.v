// Seed: 4076929140
module module_0 (
    input wire id_0,
    input wand id_1,
    output tri0 id_2,
    output supply1 id_3,
    input tri1 id_4,
    output uwire id_5,
    output tri id_6,
    input tri0 id_7,
    input tri0 id_8,
    input wand id_9,
    output tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13,
    output supply1 id_14,
    output tri id_15,
    input supply1 id_16,
    input supply0 id_17,
    output wor id_18,
    input tri id_19,
    input wire id_20#(.id_27(1)),
    output tri0 id_21,
    output tri1 id_22,
    output wire id_23,
    input wand id_24,
    input tri id_25
);
  logic [-1 : -1 'h0] id_28;
  ;
  wire id_29;
  ;
  assign module_1.id_4 = 0;
  assign id_29 = id_28[-1'b0];
endmodule
module module_1 #(
    parameter id_8 = 32'd57
) (
    output wor id_0,
    output uwire id_1,
    output supply0 id_2,
    output wor id_3,
    input tri id_4,
    input wor id_5,
    input supply1 id_6,
    output supply1 id_7,
    input supply0 _id_8
);
  assign id_3 = id_8 || -1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_0,
      id_6,
      id_1,
      id_1,
      id_6,
      id_6,
      id_5,
      id_0,
      id_5,
      id_5,
      id_6,
      id_2,
      id_2,
      id_5,
      id_4,
      id_3,
      id_6,
      id_4,
      id_3,
      id_1,
      id_7,
      id_6,
      id_6
  );
  wire [id_8 : -1  ==  -1] id_10;
  assign id_10 = id_5;
endmodule
