// Seed: 1468947025
module module_0 (
    output tri id_0,
    output tri id_1
);
  assign id_1 = -1;
endmodule
module module_1 #(
    parameter id_5 = 32'd21
) (
    input supply1 id_0,
    input supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    output supply0 id_4,
    input wor _id_5,
    output wire id_6,
    input supply1 id_7
);
  logic id_9;
  ;
  or primCall (id_4, id_0, id_7);
  assign id_4 = id_9;
  logic [1 : id_5] id_10[1 : 1 'b0];
  ;
  module_0 modCall_1 (
      id_3,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
