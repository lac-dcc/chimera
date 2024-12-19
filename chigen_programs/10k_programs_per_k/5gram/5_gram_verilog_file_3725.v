// Seed: 3897861196
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input wor id_2,
    output tri0 id_3,
    input wor id_4,
    input uwire id_5,
    output uwire id_6
    , id_10,
    input wor id_7,
    input supply0 id_8
);
  always @(negedge 1) id_3 = 1;
endmodule
module module_1 (
    output wor  id_0,
    output wire id_1,
    input  wire id_2
);
  assign id_1 = id_2 ? id_2 > 1 : 1'h0;
  supply0 id_4;
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
