// Seed: 824935400
module module_0 (
    input wire id_0,
    input wor id_1,
    input supply0 id_2,
    input tri id_3,
    input uwire id_4,
    input uwire id_5,
    output wor id_6,
    input wor id_7,
    output wand id_8,
    input supply1 id_9,
    input wand id_10,
    input supply1 id_11,
    input supply0 id_12,
    output supply1 id_13,
    input tri id_14,
    input wor id_15
);
  wire [-1 : -1 'b0] id_17;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd14,
    parameter id_6 = 32'd64
) (
    input supply0 id_0,
    output tri1 id_1,
    input wor id_2,
    input tri0 _id_3
);
  wire  id_5 = id_0;
  logic _id_6 = id_2;
  assign id_5 = id_3 ? 1 : id_2 ==? id_5++;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0
  );
  assign id_6 = id_5;
  assign id_1 = 1;
  tri [id_3  ==  -1 : id_6] id_7 = -1;
endmodule
