// Seed: 3717986014
module module_0 (
    input tri0 id_0,
    input supply1 id_1
);
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input supply1 id_2,
    output supply0 id_3,
    input wand id_4
);
  assign id_3 = -1;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_7 = 32'd87,
    parameter id_9 = 32'd25
) (
    input supply0 id_0,
    output wor id_1,
    input tri1 id_2,
    input tri0 id_3,
    input wire id_4,
    input wire id_5,
    input wire id_6,
    output wand _id_7,
    input tri1 id_8,
    output tri _id_9,
    output tri id_10
);
  always_ff
  fork
    logic [-1  ==  -1 : id_7] id_12;
    id_13();
  join
  logic [(  id_7  ) : id_9] id_14;
  ;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
  always_comb @(*) if (-1'b0 & 1) #(id_12);
endmodule
