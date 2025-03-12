// Seed: 34008637
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input wor id_2,
    input wor id_3,
    input uwire id_4,
    output uwire id_5,
    input uwire id_6,
    input tri id_7,
    input supply0 id_8,
    output tri id_9,
    input tri id_10
    , id_24,
    input supply1 id_11,
    input wire id_12,
    output wire id_13,
    input tri1 id_14,
    input supply1 id_15,
    input tri1 id_16,
    output wand id_17,
    input wire id_18,
    input wor id_19,
    input supply0 id_20,
    input supply1 id_21,
    input wand id_22
);
  wire id_25;
  ;
  parameter id_26 = 1;
  assign id_13 = id_16;
  assign module_1.id_7 = 0;
  assign id_17 = 1;
  final
  fork
  join
endmodule
module module_1 (
    output wor id_0,
    input wand id_1,
    output supply0 id_2,
    input wand id_3,
    inout tri1 id_4,
    input wor id_5,
    input uwire id_6,
    input wand id_7,
    input tri0 id_8,
    input wand id_9,
    input wire id_10,
    input tri1 id_11
    , id_22,
    input tri1 id_12,
    input wor id_13,
    input supply0 id_14,
    output supply0 id_15,
    input wor id_16,
    inout wor id_17,
    output logic id_18,
    input supply0 id_19,
    input supply1 id_20
);
  wire id_23;
  ;
  initial id_18 <= "";
  logic [-1 : -1] id_24 = id_20;
  assign id_15 = (!id_13);
  initial assign id_0 = id_17 <-> id_22;
  assign id_15 = id_11;
  wire id_25;
  assign id_2 = id_11;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_3,
      id_19,
      id_10,
      id_17,
      id_8,
      id_17,
      id_4,
      id_15,
      id_3,
      id_5,
      id_4,
      id_4,
      id_14,
      id_19,
      id_8,
      id_4,
      id_19,
      id_5,
      id_10,
      id_10,
      id_14
  );
endmodule
