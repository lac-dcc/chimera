// Seed: 1561677538
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wire id_2,
    input wire id_3,
    input wor id_4,
    input supply1 id_5,
    input wand id_6,
    output tri0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    output tri0 id_10,
    inout tri id_11,
    output tri id_12,
    input uwire id_13,
    output uwire id_14,
    input supply0 id_15,
    input wire id_16,
    input supply0 id_17,
    input wand id_18,
    input tri id_19,
    input tri1 id_20,
    input supply1 id_21,
    input tri1 id_22,
    input wire id_23,
    input wire id_24
);
  parameter id_26 = 1;
  assign id_10 = id_2 & 1;
  supply1 id_27 = id_19;
  id_28(
      -1, -1, -1, -1, id_1, -1
  );
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1,
    id_16,
    input uwire id_2,
    input tri1 id_3,
    output tri1 id_4,
    output supply0 id_5,
    output uwire id_6,
    output wire id_7,
    output tri id_8,
    input supply1 id_9,
    output supply1 id_10,
    id_17,
    input wand id_11,
    output uwire id_12,
    output uwire id_13,
    input wire id_14
);
  assign id_7 = id_3;
  wire id_18;
  wand id_19 = id_2;
  wire id_20, id_21, id_22, id_23, id_24;
  module_0 modCall_1 (
      id_14,
      id_19,
      id_1,
      id_14,
      id_2,
      id_9,
      id_19,
      id_10,
      id_1,
      id_9,
      id_19,
      id_19,
      id_8,
      id_2,
      id_6,
      id_19,
      id_19,
      id_2,
      id_19,
      id_1,
      id_2,
      id_19,
      id_9,
      id_19,
      id_3
  );
  assign modCall_1.id_22 = 0;
endmodule
