// Seed: 168638389
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output tri id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply0 id_5,
    output supply1 id_6,
    input uwire id_7
);
  wire [-1 : (  -1  )] id_9;
endmodule
module module_1 #(
    parameter id_11 = 32'd11,
    parameter id_13 = 32'd92,
    parameter id_14 = 32'd98
) (
    input tri0 id_0,
    output tri id_1,
    output tri0 id_2,
    output tri1 id_3,
    input wand id_4,
    input wand id_5
    , _id_13,
    output logic id_6,
    input supply0 id_7,
    output wand id_8,
    input tri0 id_9,
    input supply0 id_10,
    input tri0 _id_11
);
  wire _id_14;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9,
      id_7,
      id_9,
      id_8,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wire id_15;
  parameter id_16 = -1;
  assign id_6 = id_11;
  logic [1  !=  id_13 : id_11  &  id_14] id_17;
  final begin : LABEL_0
    id_6 <= -1;
  end
endmodule
