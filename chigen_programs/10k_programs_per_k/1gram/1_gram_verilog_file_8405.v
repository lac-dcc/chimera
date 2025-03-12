// Seed: 2231286002
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire [-1 : 1] id_6;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_9 = 32'd91
) (
    input supply0 id_0,
    output uwire id_1,
    output tri0 id_2,
    output tri0 id_3,
    output wire id_4,
    output wand id_5,
    output wire id_6,
    output tri0 id_7,
    output wire id_8,
    input wor _id_9,
    input supply1 id_10,
    output wor id_11,
    output tri1 id_12,
    input tri1 id_13,
    input supply0 id_14,
    output tri1 id_15
);
  logic id_17;
  ;
  wire [1 : id_9] id_18, id_19;
  module_0 modCall_1 (
      id_18,
      id_17,
      id_18,
      id_19,
      id_19
  );
  xor primCall (id_7, id_18, id_0, id_10, id_17, id_14);
endmodule
