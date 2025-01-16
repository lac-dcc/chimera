// Seed: 4202325755
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output tri0 id_2,
    id_12,
    output tri id_3,
    input tri id_4,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    input tri0 id_8,
    input supply1 id_9,
    input supply0 id_10
);
  parameter id_13 = -1'b0;
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    input wire id_2,
    output supply1 id_3,
    input tri1 id_4,
    input wand id_5,
    id_16,
    output tri0 id_6,
    output wor id_7,
    input tri1 id_8,
    input supply1 id_9,
    output wor id_10,
    input wire id_11,
    output supply0 id_12,
    output uwire id_13,
    output tri id_14
);
  parameter id_17 = -1;
  and primCall (id_7, id_5, id_11, id_0, id_16, id_2, id_8, id_1);
  assign id_3 = id_8 >= id_2;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_12,
      id_1,
      id_5,
      id_8,
      id_1,
      id_2,
      id_4,
      id_9
  );
  assign modCall_1.id_5 = 0;
  always begin : LABEL_0
    id_3 = 1;
  end
  assign id_3 = ~-1;
endmodule
