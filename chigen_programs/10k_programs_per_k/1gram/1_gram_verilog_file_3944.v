// Seed: 2570360868
module module_0 (
    input supply1 id_0,
    input wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wor id_8,
    output uwire id_9,
    input tri id_10,
    input wand id_11,
    input wor id_12,
    input wire id_13,
    input wire id_14,
    input tri1 id_15,
    input wor id_16
);
  always assign id_9 = 1 ? id_11 : id_13;
  always $signed(66);
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd6,
    parameter id_8 = 32'd98
) (
    output wand id_0,
    output wand id_1,
    input supply0 id_2,
    output supply0 _id_3,
    input wire id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wire id_7[1 : {  id_8  ==  id_3  , "" ,  -1 'b0 }],
    input tri _id_8
);
  logic id_10;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_5,
      id_6,
      id_1,
      id_5,
      id_6,
      id_2,
      id_0,
      id_2,
      id_7,
      id_5,
      id_2,
      id_2,
      id_5,
      id_2
  );
  assign modCall_1.id_11 = 0;
  assign id_10 = id_8;
endmodule
