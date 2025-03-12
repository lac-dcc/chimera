// Seed: 1768727012
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    output supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    input wire id_5,
    output tri0 id_6,
    output supply0 id_7,
    input uwire id_8,
    output tri0 id_9,
    input uwire id_10
);
  wire [1 : 1] id_12;
endmodule
module module_1 (
    input supply1 id_0,
    output uwire id_1,
    output wire id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    output supply1 id_6
);
  assign id_1 = {id_0{id_3}};
  wire id_8;
  ;
  buf primCall (id_2, id_8);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_3,
      id_4,
      id_5,
      id_6,
      id_3,
      id_5,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
