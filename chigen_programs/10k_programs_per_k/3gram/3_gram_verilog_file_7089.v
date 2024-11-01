// Seed: 256151405
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input uwire id_2,
    input wand id_3,
    output uwire id_4,
    output tri1 id_5,
    input supply1 id_6,
    input wand id_7,
    input supply1 id_8,
    output tri id_9,
    output wor id_10,
    input tri0 id_11,
    input supply1 id_12,
    input wor id_13,
    output wor id_14,
    input supply1 id_15,
    input wire id_16,
    input tri1 id_17
);
  wor  id_19 = 1;
  wire id_20;
endmodule
macromodule module_1 (
    input tri0 id_0,
    inout tri0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    output wand id_4,
    output wand id_5,
    output logic id_6,
    output tri0 id_7
    , id_16,
    output tri1 id_8,
    input tri0 id_9,
    input uwire id_10,
    input tri1 id_11,
    input wire id_12,
    output tri id_13,
    output tri1 id_14
);
  logic [7:0] id_17;
  assign id_17[1'd0] = 1;
  wire id_18;
  module_0(
      id_0,
      id_2,
      id_0,
      id_2,
      id_13,
      id_13,
      id_9,
      id_10,
      id_11,
      id_5,
      id_5,
      id_11,
      id_1,
      id_12,
      id_4,
      id_11,
      id_1,
      id_10
  );
  wire id_19, id_20, id_21;
  always id_6 = #id_22 1;
  id_23(
      .id_0(1), .id_1(id_12)
  );
endmodule
