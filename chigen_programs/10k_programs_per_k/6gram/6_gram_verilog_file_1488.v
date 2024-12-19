// Seed: 88778386
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input wor id_2,
    input supply1 id_3,
    input wand id_4,
    output supply1 id_5,
    output wand id_6,
    output tri id_7,
    output uwire id_8,
    input uwire id_9,
    input wor id_10,
    input wor id_11,
    output uwire id_12,
    output uwire id_13,
    input uwire id_14,
    output supply0 id_15,
    output supply0 id_16
);
  assign id_16 = id_0;
  supply1 id_18;
  tri id_19;
  assign id_5 = {id_11, id_18 - id_9, id_19};
  id_20(
      .id_0(id_4), .id_1(1), .id_2(id_7), .id_3(1)
  );
  assign module_1.type_8 = 0;
  wire id_21;
endmodule
module module_1 (
    input wor id_0,
    input wire id_1,
    input supply1 id_2,
    input logic id_3,
    input supply1 id_4,
    output wand id_5,
    input supply1 id_6,
    input wand id_7,
    input wire id_8,
    input uwire id_9,
    output tri0 id_10,
    output tri0 id_11,
    output supply1 id_12,
    input wor id_13,
    input wire id_14,
    input wand id_15,
    input wor id_16,
    output tri id_17,
    input tri0 id_18
);
  id_20(
      .id_0(), .id_1(1), .id_2(1), .id_3(1), .id_4(id_4)
  );
  wire id_21;
  wire id_22;
  tri id_23, id_24;
  initial if (id_23) assign id_23 = id_3;
  wire id_25;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_18,
      id_2,
      id_13,
      id_12,
      id_12,
      id_17,
      id_17,
      id_9,
      id_6,
      id_13,
      id_17,
      id_12,
      id_14,
      id_12,
      id_17
  );
  assign id_17 = 1;
endmodule
