// Seed: 2850439676
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    output wand id_2,
    input supply1 id_3,
    output tri id_4,
    input tri id_5,
    output supply1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    output tri1 id_10,
    output wor id_11,
    input wor id_12,
    output tri id_13,
    input wire id_14,
    input wor id_15,
    output wor id_16,
    input supply1 id_17,
    input wor id_18
);
  logic id_20;
  ;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd49
) (
    output supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wor id_5
);
  logic _id_7;
  ;
  wire id_8;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_2,
      id_4,
      id_3,
      id_4,
      id_1,
      id_2,
      id_5,
      id_0,
      id_4,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_3,
      id_2
  );
  supply1 id_9 = {1, id_1, id_1, -1};
  tri [id_7 : 1 'b0] id_10 = 1 - 1;
endmodule
