// Seed: 95150721
module module_0 (
    output supply0 id_0,
    output wire id_1,
    output tri0 id_2,
    input wire id_3,
    input tri id_4,
    output wire id_5,
    input tri id_6,
    input tri0 id_7,
    input wor id_8,
    input wor id_9,
    input supply0 id_10
);
  assign id_0 = !id_6;
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter id_9 = 32'd26
) (
    output wire id_0,
    input wire id_1,
    output tri id_2,
    input wire id_3,
    output wand id_4,
    input tri0 id_5,
    input wor id_6,
    input supply1 id_7
);
  defparam id_9 = id_5 === id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_3,
      id_5,
      id_4,
      id_6,
      id_1,
      id_3,
      id_6,
      id_1
  );
  assign modCall_1.type_16 = 0;
endmodule
