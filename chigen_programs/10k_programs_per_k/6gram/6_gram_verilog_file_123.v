// Seed: 4283879266
module module_0 #(
    parameter id_4 = 32'd19
) (
    input  tri1 id_0,
    input  tri  id_1,
    output tri  id_2
);
  logic _id_4;
  wire [-1 : id_4] id_5;
  wire id_6;
  assign module_1.id_7 = 0;
  always @(posedge {id_6, id_1}) release id_5;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input tri id_2,
    input wand id_3,
    input supply1 id_4,
    output supply0 id_5,
    output wor id_6,
    input wire id_7,
    output supply1 id_8
);
  logic id_10;
  ;
  or primCall (id_5, id_3, id_10, id_0, id_2);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_5
  );
endmodule
