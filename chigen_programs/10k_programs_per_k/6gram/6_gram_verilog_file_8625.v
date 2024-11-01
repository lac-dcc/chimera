// Seed: 3291920895
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri id_4,
    output tri0 id_5
    , id_22,
    input supply1 id_6,
    input tri0 id_7,
    output wire id_8,
    input wire module_0,
    output wand id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input wor id_14,
    input tri0 id_15,
    output supply1 id_16,
    input tri0 id_17,
    output supply0 id_18,
    input supply1 id_19,
    input wor id_20
);
  assign id_5  = id_11;
  assign id_18 = 1 * 1'b0 - 1;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input wire id_2,
    output tri0 id_3,
    input tri1 id_4,
    output tri0 id_5,
    input logic id_6,
    input wire id_7,
    input wor id_8,
    input supply0 id_9,
    output logic id_10
);
  initial begin
    id_10 <= id_6;
    id_10 <= 1;
  end
  nor (id_10, id_0, id_8, id_7, id_9, id_2, id_6, id_1, id_4);
  module_0(
      id_2,
      id_7,
      id_1,
      id_9,
      id_7,
      id_3,
      id_8,
      id_8,
      id_3,
      id_8,
      id_3,
      id_8,
      id_9,
      id_0,
      id_4,
      id_9,
      id_3,
      id_7,
      id_5,
      id_1,
      id_0
  );
endmodule
