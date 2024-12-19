// Seed: 4021524002
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input tri id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    input supply1 id_6,
    input wor id_7,
    input uwire id_8,
    input wand id_9,
    output uwire id_10,
    input wand id_11,
    input tri1 id_12,
    output tri0 id_13,
    output supply1 id_14
);
  assign id_10 = id_2;
  assign module_1.type_10 = 0;
  assign id_13 = 1'd0 && id_9;
endmodule
module module_1 (
    output wire id_0,
    input uwire id_1,
    inout supply0 id_2,
    input wor id_3,
    output uwire id_4,
    output supply1 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2
  );
endmodule
