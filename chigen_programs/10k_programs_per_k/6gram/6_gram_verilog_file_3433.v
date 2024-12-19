// Seed: 518321524
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri0 id_3
);
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    input wor id_3,
    input tri1 id_4,
    output tri0 id_5,
    input wire id_6,
    input wor id_7,
    input supply0 id_8,
    input supply1 id_9
);
  tri id_11;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_1,
      id_9
  );
  assign modCall_1.id_0 = 0;
  assign {id_11, 1 ? 1'b0 : id_6, id_0} = 1'b0;
endmodule
