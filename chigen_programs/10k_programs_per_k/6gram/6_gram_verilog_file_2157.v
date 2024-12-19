// Seed: 1244363970
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output tri0 id_2,
    output tri id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    output uwire id_7,
    input uwire id_8,
    input uwire id_9,
    output supply0 id_10,
    input wor id_11,
    input supply0 id_12,
    input wire id_13,
    input wand id_14,
    output tri id_15
);
  wire id_17;
  assign module_1.id_11 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd82,
    parameter id_12 = 32'd82
) (
    output wor id_0,
    input wire id_1,
    input tri id_2,
    output tri id_3,
    output tri0 id_4,
    input supply0 id_5,
    input uwire id_6,
    output supply0 id_7,
    output tri0 id_8,
    input tri0 id_9
);
  defparam id_11.id_12 = 1;
  wire id_13;
  and primCall (id_4, id_13, id_2, id_14, id_6, id_5, id_9, id_12, id_11, id_1);
  wire id_14;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_0,
      id_7,
      id_5,
      id_9,
      id_6,
      id_8,
      id_9,
      id_2,
      id_0,
      id_2,
      id_9,
      id_1,
      id_2,
      id_4
  );
endmodule
