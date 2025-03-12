// Seed: 3152662962
program module_0 (
    input wor id_0,
    input wire id_1,
    input wor id_2,
    output supply0 id_3,
    input wor id_4,
    input wor id_5,
    output supply0 id_6,
    input tri0 id_7,
    output wand id_8,
    input wor id_9
);
  assign id_8 = 1 - id_4;
  assign module_1.id_2 = 0;
  assign id_8 = -1'd0;
  logic id_11;
  ;
endprogram
module module_1 #(
    parameter id_2 = 32'd67
) (
    input tri1 id_0,
    input supply1 id_1,
    input tri _id_2,
    input wand id_3,
    input supply0 id_4,
    input wand id_5,
    output wor id_6,
    output tri1 id_7[id_2 : -1],
    input wire id_8,
    input wire id_9,
    input supply1 id_10,
    input tri id_11
);
  assign id_6 = id_3;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_1,
      id_7,
      id_9,
      id_1,
      id_6,
      id_8,
      id_6,
      id_10
  );
endmodule
