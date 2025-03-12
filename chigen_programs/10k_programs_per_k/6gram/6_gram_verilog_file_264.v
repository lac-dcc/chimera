// Seed: 3474230548
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input tri1 id_2,
    output supply1 id_3,
    output wire id_4,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    input tri id_8,
    input supply1 id_9,
    output tri0 id_10
);
  logic id_12 = -1;
  assign module_2.id_4 = 0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    output wand id_2,
    output tri1 id_3
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_3
  );
endmodule
module module_2 #(
    parameter id_1 = 32'd6
) (
    input  tri0 id_0,
    input  wand _id_1,
    input  tri1 id_2,
    output tri1 id_3,
    input  wor  id_4,
    output wand id_5
);
  wire id_7;
  wire [id_1 : !  id_1] id_8;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_3
  );
endmodule
