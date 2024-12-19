// Seed: 2454627493
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    output tri id_3,
    output supply1 id_4,
    input uwire id_5,
    input wand id_6,
    output tri0 id_7,
    input uwire id_8
);
  always disable id_10;
  wire id_11;
  supply0 id_12;
  wire id_13;
  wire id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25;
  wire id_26;
  assign id_12 = 1;
  wire id_27, id_28, id_29, id_30;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    input wand id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    input supply1 id_6,
    input supply1 id_7,
    output tri0 id_8,
    output wor id_9,
    input tri0 id_10,
    input wire id_11,
    output wire id_12
);
  id_14(
      .id_0(id_10), .id_1(id_12), .id_2(1), .id_3()
  );
  nor primCall (id_9, id_10, id_6, id_3, id_7, id_0, id_5, id_2, id_14);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_9,
      id_9,
      id_11,
      id_6,
      id_8,
      id_4
  );
  assign id_9  = ~id_7;
  assign id_12 = id_5;
endmodule
