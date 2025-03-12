// Seed: 4184992465
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input wire id_2,
    input uwire id_3,
    input wand id_4,
    output tri0 id_5
);
  wire id_7;
  assign module_2.id_13 = 0;
  wire id_8;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input wor id_2,
    input wand id_3,
    output tri0 id_4,
    output supply1 id_5,
    input supply1 id_6,
    input supply1 id_7
);
  initial $clog2(5);
  ;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_6,
      id_0,
      id_6,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input wor id_0,
    input tri id_1,
    output uwire id_2,
    output tri id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wor id_6,
    input supply1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    inout wand id_10,
    output uwire id_11,
    output supply1 id_12,
    output wire id_13,
    output tri0 id_14,
    input tri1 id_15,
    input wire id_16,
    input supply0 id_17
);
  assign id_12 = id_0;
  nor primCall (id_13, id_16, id_5, id_10, id_7, id_17, id_1, id_4, id_9, id_0, id_15, id_8);
  module_0 modCall_1 (
      id_4,
      id_16,
      id_17,
      id_4,
      id_8,
      id_13
  );
endmodule
