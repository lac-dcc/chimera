// Seed: 3875880363
module module_0 (
    output tri id_0,
    input supply0 id_1,
    input wor id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output wire id_6,
    input supply1 id_7,
    input wor id_8,
    input supply1 id_9,
    input tri1 id_10,
    input uwire id_11
);
  wire id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24;
  assign id_0 = 1'b0;
  wire id_25 = id_14;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wire id_4,
    input tri0 id_5,
    input tri id_6,
    input tri1 id_7,
    output tri id_8,
    input wor id_9
);
  assign id_8 = {id_5, 1, id_3};
  module_0 modCall_1 (
      id_8,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_8,
      id_1,
      id_2,
      id_1,
      id_1,
      id_3
  );
endmodule
