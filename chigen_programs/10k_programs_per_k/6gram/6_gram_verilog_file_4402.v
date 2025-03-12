// Seed: 3158768150
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input tri0 id_2,
    input wand id_3,
    output wire id_4,
    input wor id_5,
    input tri0 id_6,
    input supply1 id_7,
    input uwire id_8,
    input tri id_9,
    input wor id_10,
    input supply1 id_11
    , id_23,
    output tri id_12,
    input supply1 id_13,
    input supply0 id_14,
    input wor id_15,
    input wire id_16,
    input supply0 id_17,
    input tri1 id_18,
    input uwire id_19
    , id_24,
    input tri id_20,
    output tri0 id_21
);
  wire id_25;
  assign module_1.id_2 = 0;
  wire id_26;
  tri  id_27;
  assign id_27 = -1'd0 - 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd71
) (
    input tri0 _id_0,
    input tri1 id_1,
    output wire id_2,
    output wire id_3,
    output wand id_4,
    input tri0 id_5,
    output supply0 id_6,
    input uwire id_7,
    output tri0 id_8
);
  assign id_6 = id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_1,
      id_4,
      id_5,
      id_7,
      id_7,
      id_7,
      id_1,
      id_1,
      id_1,
      id_6,
      id_7,
      id_5,
      id_7,
      id_1,
      id_1,
      id_7,
      id_7,
      id_5,
      id_4
  );
  wire [1 : -1  !=?  id_0  -  1] id_10;
  assign id_6 = -1;
  or primCall (id_4, id_7, id_1, id_5);
endmodule
