// Seed: 3563479032
module module_0 #(
    parameter id_12 = 32'd62
) (
    output wor id_0,
    input tri0 id_1,
    input uwire id_2
    , id_11,
    input wor id_3,
    output tri id_4,
    output uwire id_5,
    input supply1 id_6,
    output uwire id_7,
    input tri1 id_8,
    input wire id_9
);
  initial cover (id_8);
  assign id_4 = id_2;
  wire [(  1  ) : -1] _id_12;
  supply1 id_13;
  ;
  if (-1) assign id_13 = -1;
  logic [-1 : id_12] id_14;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply0 id_3,
    output wor id_4,
    output wire id_5,
    input supply1 id_6,
    input wor id_7,
    input wire id_8,
    input uwire id_9,
    output uwire id_10,
    input tri id_11
);
  assign id_3 = 1;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_7,
      id_10,
      id_4,
      id_7,
      id_10,
      id_6,
      id_8
  );
  assign modCall_1.id_5 = 0;
endmodule
