// Seed: 4005136260
module module_0 (
    output wor id_0,
    input tri id_1,
    input uwire id_2,
    output uwire id_3,
    input wire id_4,
    input wor id_5,
    input tri id_6,
    input tri id_7,
    input tri0 id_8,
    input wor id_9,
    output tri1 id_10,
    output supply1 id_11,
    input uwire id_12,
    input wor id_13
);
  wire [-1 : 1 'b0] id_15;
  parameter id_16 = -1 == 1;
  assign id_10 = id_16;
endmodule
module module_1 #(
    parameter id_0 = 32'd70,
    parameter id_5 = 32'd62
) (
    input wor _id_0,
    output tri id_1,
    input supply1 id_2,
    output tri1 id_3,
    output wire id_4,
    input tri1 _id_5,
    output uwire id_6,
    output tri1 id_7,
    input wand id_8
);
  wire [(  (  id_0  )  ==  id_5  ) : -1] id_10;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_2,
      id_1,
      id_8,
      id_8,
      id_8,
      id_2,
      id_8,
      id_2,
      id_1,
      id_6,
      id_2,
      id_8
  );
  assign modCall_1.id_9 = 0;
endmodule
