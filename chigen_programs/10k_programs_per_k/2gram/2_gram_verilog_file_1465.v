// Seed: 2759030786
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    output wor id_2,
    output tri id_3,
    output tri id_4,
    input supply1 id_5,
    output supply0 id_6,
    input wire id_7
);
  assign id_6 = id_0;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd79,
    parameter id_3 = 32'd18
) (
    input supply0 _id_0,
    input tri id_1,
    output tri1 id_2,
    input tri1 _id_3,
    input supply1 id_4,
    output uwire id_5,
    output tri1 id_6,
    output tri0 id_7,
    input supply1 id_8
);
  logic [7:0][id_3 : id_0] id_10;
  nand primCall (id_7, id_4, id_1, id_10, id_8);
  module_0 modCall_1 (
      id_8,
      id_1,
      id_6,
      id_6,
      id_7,
      id_4,
      id_6,
      id_4
  );
  always @(posedge id_10[-1 :-1]);
endmodule
