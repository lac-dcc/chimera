// Seed: 2417748817
module module_0 (
    input supply1 id_0,
    input wand id_1
);
  tri1 id_3;
  assign id_3 = (id_3 != 1);
  wire id_4;
  assign module_2.id_12 = 0;
  assign module_1.id_2  = 0;
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    input supply1 id_2,
    output supply0 id_3,
    input wor id_4,
    input tri id_5,
    input wire id_6,
    output wire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_2
  );
endmodule
module module_2 #(
    parameter id_20 = 32'd77,
    parameter id_21 = 32'd11
) (
    output tri id_0,
    input uwire id_1,
    input supply0 id_2,
    input wor id_3,
    input tri id_4,
    output wand id_5,
    input supply0 id_6,
    input wand id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    input wor id_11,
    input wire id_12,
    input supply0 id_13,
    output wand id_14,
    input supply1 id_15,
    input supply1 id_16,
    input supply1 id_17
);
  assign id_0 = id_11 ? 1 << 1 - id_11 : id_12;
  and primCall (id_14, id_1, id_4, id_13, id_17, id_7, id_6, id_3);
  module_0 modCall_1 (
      id_4,
      id_16
  );
  wire id_19;
  defparam id_20.id_21 = 1;
endmodule
