// Seed: 857923357
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wand id_3,
    input tri0 id_4,
    output tri1 id_5,
    output tri0 id_6,
    output wand id_7,
    output wor id_8,
    input wor id_9,
    output wire id_10,
    input tri1 id_11,
    input tri1 id_12,
    input tri id_13,
    input tri0 id_14,
    input wor id_15,
    input wor id_16,
    input tri id_17,
    output wand id_18
);
  wire id_20;
  wire id_21;
  wire id_22;
  assign #(1) id_6 = 1'b0 >= 1;
  wire id_23;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply0 id_4,
    output wire id_5,
    input wor id_6,
    input tri0 id_7
    , id_20,
    input tri0 id_8,
    output uwire id_9,
    input tri id_10,
    input supply1 id_11,
    input supply1 id_12,
    output wand id_13,
    output uwire id_14,
    output uwire id_15,
    output wire id_16,
    output logic id_17,
    output wand id_18
);
  always
  fork
    id_20 = 1;
    if (1) begin
      id_17 <= 1 - id_8;
    end
  join
  module_0(
      id_2,
      id_1,
      id_6,
      id_4,
      id_6,
      id_15,
      id_13,
      id_9,
      id_15,
      id_3,
      id_14,
      id_0,
      id_10,
      id_12,
      id_2,
      id_0,
      id_1,
      id_6,
      id_5
  );
endmodule
