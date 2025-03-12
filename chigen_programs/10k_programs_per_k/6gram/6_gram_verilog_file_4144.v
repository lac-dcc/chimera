// Seed: 653799569
module module_0 (
    input wor id_0,
    output tri id_1,
    input tri id_2,
    input supply0 id_3,
    input wand id_4,
    output tri id_5,
    output wor id_6,
    output tri1 id_7,
    input wire id_8,
    input tri id_9,
    output supply1 id_10
);
  assign id_7 = id_0;
  assign module_1.id_19 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd75,
    parameter id_6 = 32'd94
) (
    input wor id_0,
    output supply0 _id_1,
    input tri id_2,
    input tri id_3,
    output supply0 id_4,
    output logic id_5,
    input supply0 _id_6,
    output supply1 id_7,
    input supply1 id_8,
    output tri0 id_9
);
  wire id_11;
  logic [id_1 : 1] id_12;
  always
  fork : SymbolIdentifier
    id_5 = id_11;
    logic [-1 : id_6] id_13, id_14;
    #1 id_14 = id_2;
  join
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_8,
      id_0,
      id_4,
      id_4,
      id_7,
      id_2,
      id_0,
      id_9
  );
  assign id_12 = -1;
  supply1 [1 : -1] \id_15 = -1'b0 && 1;
  and primCall (id_9, id_14, id_12, id_13, id_2, id_11, id_3, id_8);
  specify
    (id_16 => id_17) = (id_6  : id_6  : 1 + id_13);
    (id_18 => id_19) = (id_13  : id_0 == -1  : -1, -1);
  endspecify
endmodule
