// Seed: 242561801
module module_0 (
    input tri0 id_0,
    output wor id_1,
    output tri0 id_2,
    input wor id_3,
    input wor id_4,
    input tri0 id_5,
    output wand id_6,
    input tri0 id_7,
    input wand id_8,
    output supply0 id_9,
    output uwire id_10,
    output supply1 id_11,
    input tri id_12,
    output uwire id_13,
    input wire id_14,
    output wand id_15,
    input tri1 id_16
);
  wire [-1 : 1  *  1 'b0 - 'b0] id_18;
  assign module_1._id_0 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd45
) (
    input supply1 _id_0,
    input wire id_1,
    output uwire id_2,
    output tri1 id_3,
    input supply0 id_4,
    output supply0 id_5,
    input tri id_6,
    input tri1 id_7,
    input tri0 id_8,
    output tri0 id_9,
    input uwire id_10,
    input supply1 id_11
);
  wire [(  -1  ) : id_0] id_13;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_9,
      id_8,
      id_6,
      id_7,
      id_5,
      id_7,
      id_10,
      id_2,
      id_9,
      id_2,
      id_10,
      id_3,
      id_11,
      id_5,
      id_6
  );
  assign id_5 = id_10;
endmodule
