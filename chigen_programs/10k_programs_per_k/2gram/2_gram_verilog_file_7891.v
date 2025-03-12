// Seed: 3990632474
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output wire id_2,
    input supply1 id_3,
    input wor id_4,
    input tri id_5,
    input tri0 id_6,
    input uwire id_7,
    input supply1 id_8,
    input wor id_9
);
  assign id_2 = id_8;
  logic id_11;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    output tri1 id_2,
    input wand id_3,
    output wire id_4,
    input wire id_5,
    output uwire id_6,
    input tri1 id_7,
    input wor id_8,
    input wor id_9,
    input wand id_10,
    input wire id_11,
    output supply1 id_12
);
  assign id_6 = id_0;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_5,
      id_11,
      id_9,
      id_7,
      id_10,
      id_10,
      id_8
  );
  assign modCall_1.id_0 = 0;
endmodule
