// Seed: 3743856100
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    input uwire id_4,
    output tri1 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input supply0 id_10,
    output wor id_11,
    input wor id_12
);
  assign id_0 = id_9;
  parameter id_14 = -1'b0;
  wire  id_15;
  logic id_16 = -1;
  wire id_17, id_18;
endmodule
module module_1 #(
    parameter id_8 = 32'd90
) (
    output logic id_0,
    output wor id_1,
    input supply1 id_2,
    input tri1 id_3,
    input tri1 id_4,
    output uwire id_5,
    output uwire id_6,
    input tri1 id_7,
    output tri _id_8
    , id_11,
    input wor id_9[id_8 : -1]
);
  always id_0 <= id_2 & id_3;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_9,
      id_4,
      id_5,
      id_2,
      id_4,
      id_7,
      id_9,
      id_7,
      id_6,
      id_2
  );
  assign modCall_1.id_0 = 0;
  logic id_12;
  ;
endmodule
