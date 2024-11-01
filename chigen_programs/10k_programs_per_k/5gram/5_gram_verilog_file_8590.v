// Seed: 2411071522
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output supply0 id_2,
    output supply0 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input wor id_6,
    output wor id_7
    , id_29,
    input wor id_8,
    input tri0 id_9,
    input tri0 id_10,
    output tri1 id_11,
    input uwire id_12,
    input supply1 id_13,
    input tri id_14,
    input wand id_15,
    input wor id_16,
    input supply0 id_17,
    input wor id_18,
    output tri0 id_19,
    output uwire id_20,
    output wor id_21,
    input uwire id_22,
    input supply0 id_23,
    input tri0 id_24,
    output tri id_25,
    output tri0 id_26,
    output tri id_27
);
  wire id_30;
  assign id_29 = id_22 < 1;
  assign id_7  = id_4;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output tri id_2,
    input wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    inout tri0 id_6,
    input wand id_7,
    output tri0 id_8,
    input wor id_9,
    input supply0 id_10,
    inout tri0 id_11,
    input tri0 id_12,
    output wand id_13,
    output uwire id_14,
    output supply1 id_15,
    output tri id_16,
    input supply1 id_17,
    output wire id_18
);
  wire id_20;
  xnor (id_18, id_9, id_12, id_11, id_17, id_20, id_6, id_3, id_7, id_10, id_1, id_5);
  assign id_6 = id_6;
  module_0(
      id_5,
      id_1,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6,
      id_11,
      id_9,
      id_9,
      id_6,
      id_18,
      id_10,
      id_12,
      id_6,
      id_0,
      id_9,
      id_6,
      id_10,
      id_14,
      id_6,
      id_13,
      id_6,
      id_12,
      id_6,
      id_4,
      id_2,
      id_18
  );
endmodule
