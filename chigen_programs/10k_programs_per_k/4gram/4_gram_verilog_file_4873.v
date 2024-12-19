// Seed: 1908415976
module module_0 (
    output uwire id_0,
    output wire id_1,
    input supply1 id_2,
    input wire id_3,
    input tri0 id_4,
    input tri0 id_5,
    output supply1 id_6,
    output wand id_7,
    input tri id_8,
    output tri1 id_9,
    input wire id_10,
    input wor id_11,
    input supply0 id_12,
    input supply0 id_13,
    input supply0 id_14,
    input wor id_15
);
  assign id_1 = 1;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output supply1 id_6,
    input wor id_7,
    input tri1 id_8,
    output uwire id_9,
    inout supply1 id_10,
    output uwire id_11,
    input supply0 id_12,
    output tri id_13,
    input wor id_14,
    output wire id_15,
    output supply0 id_16
);
  assign id_16 = id_7 ? 1 : 1 ? id_3 : id_12;
  assign id_1  = id_12;
  wire id_18;
  and primCall (id_11, id_8, id_5, id_12, id_2, id_4, id_14, id_3, id_7, id_18, id_10);
  module_0 modCall_1 (
      id_15,
      id_16,
      id_4,
      id_2,
      id_2,
      id_3,
      id_6,
      id_10,
      id_2,
      id_10,
      id_5,
      id_4,
      id_14,
      id_12,
      id_10,
      id_8
  );
endmodule
