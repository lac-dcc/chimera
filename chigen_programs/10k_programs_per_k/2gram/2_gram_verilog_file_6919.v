// Seed: 2757244474
module module_0 (
    input tri1 id_0,
    output tri id_1,
    output wand id_2,
    input wor id_3,
    input tri id_4,
    input supply1 id_5
    , id_10,
    input supply0 id_6,
    input supply1 id_7,
    output wand id_8
);
  assign id_8 = id_5;
  assign id_1 = 1'd0;
  assign module_2.type_2 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    output tri1  id_1,
    output uwire id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    input wand id_1,
    input uwire id_2,
    output tri1 id_3,
    output supply1 id_4,
    input wand id_5,
    input wor id_6,
    input supply0 id_7,
    input wor id_8,
    input uwire id_9,
    output supply1 id_10,
    output tri id_11,
    output wor id_12,
    input tri0 id_13,
    input supply1 id_14,
    output wor id_15,
    output wor id_16,
    output supply1 id_17
);
  assign id_17 = id_13(1) ? id_2 : id_1;
  module_0 modCall_1 (
      id_7,
      id_16,
      id_17,
      id_2,
      id_2,
      id_13,
      id_6,
      id_7,
      id_11
  );
endmodule
