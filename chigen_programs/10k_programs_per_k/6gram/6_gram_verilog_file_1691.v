// Seed: 3175378589
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wire id_3,
    output supply1 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    output uwire id_8,
    input uwire id_9,
    input tri0 id_10,
    input tri1 id_11,
    output wor id_12,
    output uwire id_13,
    input tri0 id_14,
    output wire id_15,
    output wand id_16
);
  assign id_12 = 1 & id_0 ? id_6 : id_7;
endmodule
module module_1 #(
    parameter id_0  = 32'd42,
    parameter id_10 = 32'd34,
    parameter id_2  = 32'd72,
    parameter id_8  = 32'd65
) (
    input tri0 _id_0,
    input wor id_1
    , id_12,
    input supply1 _id_2,
    input wor id_3,
    output wor id_4,
    input tri id_5,
    input tri id_6,
    input supply1 id_7,
    input supply0 _id_8,
    output tri id_9,
    output wand _id_10
);
  parameter id_13 = 1;
  logic [id_2 : id_10] id_14;
  wire [{  id_8  |  1  ,  1  ~^  -1  ==  id_0  ,  1  ,  id_2  ==  -1  } : -1] id_15;
  wire id_16;
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_7,
      id_9,
      id_6,
      id_3,
      id_6,
      id_4,
      id_1,
      id_1,
      id_5,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_14 = 0;
  assign id_4 = -1'b0;
  logic [7:0] id_17;
  assign (strong1, weak0) id_16 = id_6;
  assign id_17[-1] = 1'b0;
endmodule
