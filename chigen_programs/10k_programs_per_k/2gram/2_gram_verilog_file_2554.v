// Seed: 249065132
module module_0 (
    output uwire id_0,
    input tri id_1,
    output tri1 id_2,
    output wire id_3,
    input wor id_4,
    output supply1 id_5,
    input tri1 id_6,
    output wor id_7,
    input supply0 id_8,
    output wor id_9,
    output uwire id_10,
    output tri0 id_11,
    input tri id_12
);
endmodule
module module_1 #(
    parameter id_0 = 32'd25
) (
    input tri1 _id_0,
    input uwire id_1,
    input wor id_2,
    input wor id_3#(.id_7(1)),
    output supply1 id_4,
    input supply0 id_5
);
  struct packed {
    logic id_8;
    logic [1 : id_0] id_9;
  } id_10 = id_7;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_0 = 0;
  assign id_10 = 1;
endmodule
