// Seed: 134050318
module module_0 (
    input wand id_0,
    input tri id_1,
    output uwire id_2,
    output wor id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    input wire id_8,
    input uwire id_9,
    input wor id_10,
    input wor id_11,
    output uwire id_12,
    input uwire id_13,
    input uwire id_14,
    input supply0 id_15,
    output tri id_16
);
  assign module_1.type_1 = 0;
  wire id_18, id_19;
  wire id_20;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    output supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    output supply1 id_5,
    input wor id_6,
    output wire id_7,
    output uwire id_8,
    input tri id_9,
    input tri id_10,
    input tri0 id_11,
    id_15 = 1'b0,
    output tri1 id_12,
    inout tri0 id_13
);
  wire id_16;
  xor primCall (id_2, id_10, id_13, id_11, id_16, id_0, id_15, id_1, id_6, id_4, id_9, id_17);
  parameter id_17 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_3,
      id_5,
      id_13,
      id_4,
      id_13,
      id_1,
      id_1,
      id_13,
      id_9,
      id_9,
      id_3,
      id_0,
      id_1,
      id_13,
      id_2
  );
  assign id_7 = id_1;
endmodule
