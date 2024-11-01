// Seed: 996684105
module module_0 (
    input wor id_0,
    input supply1 id_1,
    output tri0 id_2,
    input wor id_3,
    output tri0 id_4,
    input wire id_5,
    output wire id_6,
    input wire id_7
    , id_28,
    input supply1 id_8,
    input wand id_9,
    output wor id_10,
    input wor id_11,
    output uwire id_12,
    output supply1 id_13,
    input tri1 id_14,
    input wor id_15,
    input tri0 id_16,
    output wire id_17,
    input tri0 id_18,
    output supply0 id_19,
    input tri1 id_20,
    output wand id_21,
    input uwire id_22,
    input tri0 id_23,
    input wor id_24,
    input supply1 id_25,
    input wire id_26
);
  assign id_28 = id_9;
  assign id_12 = 1;
  wor id_29 = 1'b0;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    input tri0 id_2,
    input logic id_3
    , id_13,
    output logic id_4,
    output wand id_5,
    output tri0 id_6,
    output supply1 id_7,
    input tri1 id_8,
    input uwire id_9,
    output tri id_10,
    input tri0 id_11
);
  assign id_13 = 1 & id_3;
  wire id_14;
  wand id_15 = 1'b0;
  module_0(
      id_8,
      id_11,
      id_7,
      id_11,
      id_10,
      id_2,
      id_7,
      id_8,
      id_1,
      id_9,
      id_6,
      id_2,
      id_7,
      id_6,
      id_8,
      id_1,
      id_0,
      id_10,
      id_9,
      id_7,
      id_9,
      id_5,
      id_0,
      id_2,
      id_8,
      id_9,
      id_9
  );
  always @(posedge id_15++
  )
  begin
    id_4 = id_13;
  end
  assign id_13 = id_3;
  assign id_7  = id_11;
  always
    if (id_2) $display;
    else
      fork
        id_13 <= 1'b0;
      join_any
endmodule
