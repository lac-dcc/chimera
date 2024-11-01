// Seed: 1039447061
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input supply1 id_2,
    output wor id_3,
    input supply0 id_4,
    input wand id_5
    , id_21,
    input wor id_6,
    output tri id_7,
    input uwire id_8,
    input wand id_9,
    input tri1 id_10,
    output wor id_11,
    input uwire id_12,
    input supply1 id_13,
    input tri id_14,
    output wor id_15,
    input tri0 id_16,
    output supply1 id_17,
    input uwire id_18,
    input supply0 id_19
);
  wire id_22;
  assign id_17 = id_1;
  wire id_23, id_24;
  assign id_15 = id_1;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    input tri1 id_2
);
  module_0(
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2
  );
  always_latch id_1 <= ~1;
  wor id_4;
  for (id_5 = id_2; id_4; id_1 = ~id_2) id_6 : assert property (@(1) ~id_5) #1 $display(id_2);
  wire id_7;
  for (id_8 = id_2; 1; id_5 = 1) wire id_9;
endmodule
