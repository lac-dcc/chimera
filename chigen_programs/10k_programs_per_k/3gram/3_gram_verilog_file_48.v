// Seed: 500831284
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input wor id_2,
    input supply1 id_3,
    input uwire id_4,
    output tri id_5,
    input wor id_6,
    input wor id_7,
    output tri id_8,
    input wire id_9,
    input wire id_10,
    output supply0 id_11,
    input supply0 id_12,
    output tri1 id_13,
    output wor id_14,
    input wand id_15,
    input supply0 id_16,
    input uwire id_17,
    input wand id_18,
    input supply1 id_19,
    input wor id_20,
    output tri id_21,
    input supply1 id_22
);
  logic [1 : -1] id_24;
  ;
  assign module_1.id_0 = 0;
  assign id_5 = id_18 == id_20;
endmodule
module module_1 #(
    parameter id_4 = 32'd1
) (
    input wire id_0,
    input tri0 id_1,
    input tri id_2,
    input supply0 id_3,
    input tri _id_4
    , id_7,
    output uwire id_5
);
  bit [1 : (  id_4  )] id_8;
  always @(posedge -1 & id_0) if (1) id_8 <= -1;
  wire id_9;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3,
      id_0,
      id_3,
      id_5,
      id_1,
      id_2,
      id_5,
      id_3,
      id_0,
      id_5,
      id_3,
      id_5,
      id_5,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_0,
      id_5,
      id_1
  );
  assign id_5 = id_4;
endmodule
