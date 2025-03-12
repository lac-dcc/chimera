// Seed: 134534999
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input wor id_2,
    output wor id_3,
    output uwire id_4,
    input supply0 id_5,
    input uwire id_6,
    output wor id_7,
    output tri1 id_8,
    input supply0 id_9,
    output supply0 id_10,
    output wor id_11,
    output tri1 id_12,
    output wor id_13
);
  initial begin : LABEL_0
    wait (1);
  end
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  tri1  id_3
);
  tri1 id_5;
  assign id_5 = 1;
  not primCall (id_1, id_5);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
