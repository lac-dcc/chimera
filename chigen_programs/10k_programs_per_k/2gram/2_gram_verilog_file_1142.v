// Seed: 1774190546
module module_0 (
    output wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output wire id_4,
    input wand id_5,
    input wire id_6,
    input wand id_7,
    output supply0 id_8,
    input uwire id_9
);
  assign id_4 = -1'b0;
endmodule
module module_1 #(
    parameter id_12 = 32'd29
) (
    input wand id_0,
    output supply1 id_1,
    input wire id_2,
    input supply1 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    output logic id_7,
    input tri id_8,
    output supply1 id_9,
    input uwire id_10,
    output uwire id_11,
    input supply0 _id_12
);
  always begin : LABEL_0
    id_7 = "";
  end
  wire id_14[-1 'b0 : id_12];
  ;
  and primCall (id_5, id_3, id_6, id_2, id_10, id_0, id_4, id_14);
  module_0 modCall_1 (
      id_11,
      id_10,
      id_8,
      id_3,
      id_11,
      id_8,
      id_10,
      id_10,
      id_11,
      id_8
  );
  assign modCall_1.id_5 = 0;
  wire id_15;
endmodule
