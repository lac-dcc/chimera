// Seed: 301948040
module module_0 #(
    parameter id_12 = 32'd29,
    parameter id_13 = 32'd3
) (
    output supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    output tri0 id_3,
    input tri1 id_4,
    output supply1 id_5,
    output tri id_6,
    output wand id_7,
    input wire id_8,
    input wire id_9,
    input tri0 id_10
);
  defparam id_12.id_13 = 1;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input tri id_4
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_3,
      id_4,
      id_3,
      id_0,
      id_0,
      id_1,
      id_4,
      id_2
  );
endmodule
