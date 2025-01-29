// Seed: 898427354
module module_0 (
    output uwire id_0,
    input wor id_1,
    input supply1 id_2,
    input tri1 id_3,
    output tri id_4,
    input wor id_5,
    output tri1 id_6,
    input uwire id_7,
    output tri1 id_8,
    input tri1 id_9,
    input uwire id_10,
    output tri0 id_11,
    input tri id_12,
    input tri id_13,
    input supply0 id_14,
    input wor id_15,
    input tri0 id_16,
    input supply1 id_17,
    input tri id_18,
    input tri id_19
);
  wire id_21;
  assign module_1.type_2 = 0;
  assign id_4 = 1'b0 && id_18;
endmodule
module module_1 (
    output supply1 id_0,
    input  supply0 id_1,
    input  supply1 id_2
);
  wand id_4;
  supply1 id_5;
  wire id_6;
  assign id_4 = id_5;
  id_7(
      .id_0('b0), .id_1(id_5), .id_2(id_6), .id_3(id_4 - 1'b0)
  );
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2
  );
endmodule
