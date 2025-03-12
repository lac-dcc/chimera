// Seed: 1040042360
module module_0 (
    output supply1 id_0,
    input supply0 id_1
    , id_7,
    input wor id_2,
    input wand id_3,
    output supply1 id_4,
    input supply0 id_5
);
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    input wire id_2,
    input supply1 id_3,
    input wire id_4,
    input wand id_5,
    input tri1 id_6
);
  assign id_0 = 'h0;
  assign id_0 = -1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_2,
      id_0,
      id_3
  );
  assign modCall_1.id_4 = 0;
  assign id_0 = id_5;
endmodule
module module_2 #(
    parameter id_1 = 32'd60
) (
    input  tri0 id_0,
    input  tri0 _id_1,
    input  tri  id_2,
    output tri  id_3
);
  logic [7:0][id_1 : 1 'b0] id_5;
  assign id_3 = id_0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_3,
      id_2
  );
  assign id_5[1==-1] = 1 ? id_2 & -1'b0 : id_5;
endmodule
