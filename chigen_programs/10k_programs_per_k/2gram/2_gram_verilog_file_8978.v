// Seed: 2810036244
module module_0 #(
    parameter id_6 = 32'd91
) (
    input wor id_0,
    input tri id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4
);
  wire _id_6;
  wire id_7;
  logic [1 : id_6] id_8;
  ;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    output supply0 id_2,
    input supply0 id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    output wand id_7,
    output tri id_8,
    output uwire id_9,
    input tri1 id_10,
    output wor id_11,
    input wire id_12
);
  logic id_14;
  and primCall (id_9, id_14, id_3, id_6, id_10, id_4, id_12);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_6,
      id_12,
      id_5
  );
  always begin : LABEL_0
    id_1 = 1;
  end
  assign id_9 = id_3;
endmodule
