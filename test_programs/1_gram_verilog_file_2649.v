// Seed: 996616866
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input uwire id_2,
    input wor id_3,
    output uwire id_4,
    output wor id_5,
    input uwire id_6,
    output uwire id_7,
    input tri id_8,
    input wand id_9,
    output supply0 id_10,
    input supply0 id_11,
    output supply1 id_12,
    output supply0 id_13,
    input tri0 id_14,
    input tri id_15,
    output supply0 id_16
);
  wire id_18;
  assign module_1.id_3 = 0;
  wire id_19;
endmodule
module module_1 (
    inout tri1 id_0,
    output tri id_1,
    input wand id_2,
    input supply1 id_3,
    output tri1 id_4
);
  wire id_6;
  xor primCall (id_0, id_6, id_3, id_2);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_3,
      id_4,
      id_2,
      id_3,
      id_4,
      id_0,
      id_1,
      id_1,
      id_3,
      id_0,
      id_0
  );
endmodule
