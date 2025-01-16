// Seed: 4139158288
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output supply1 id_2,
    id_21,
    output tri1 id_3,
    output wire id_4,
    input tri1 id_5,
    input tri id_6,
    output wand id_7,
    input wor id_8,
    input wire id_9,
    input wire id_10,
    output tri0 id_11,
    input supply1 id_12,
    input supply0 id_13,
    input supply1 id_14,
    input tri0 id_15,
    output wire id_16,
    input supply1 id_17,
    output tri id_18,
    output tri id_19
);
  supply0 id_22;
  wire id_23;
  wire id_24;
  id_25(
      1, (id_9)
  );
  uwire id_26;
  assign module_1.type_0 = 0;
  wire id_27;
  wire id_28;
  always id_7 = id_26;
  assign id_22 = -1;
endmodule
module module_1 (
    output supply1 id_0,
    input  supply1 id_1,
    input  supply1 id_2
);
  assign id_0 = id_1 != 1;
  id_4(
      id_2, -1, id_0, id_2, id_1, 1
  );
  wire id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0
  );
endmodule
