// Seed: 855122808
module module_0 (
    output tri id_0,
    output tri0 id_1,
    output tri0 id_2,
    input wor id_3,
    input supply1 id_4,
    input tri1 id_5,
    input uwire id_6,
    input wor id_7,
    input wor id_8,
    output tri0 id_9,
    output wire id_10,
    input supply1 id_11,
    output supply1 id_12,
    output supply0 id_13,
    input supply0 id_14,
    output wor id_15,
    output wor id_16,
    input wire id_17,
    input supply0 id_18,
    input wor id_19
);
  wire id_21;
endmodule
module module_1 (
    output wand id_0,
    output tri0 id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri id_4,
    input wire id_5,
    input wor id_6,
    output logic id_7,
    input tri1 id_8,
    input tri0 id_9,
    output logic id_10,
    output tri id_11,
    input tri id_12,
    input wire id_13,
    input logic id_14,
    input wire id_15,
    output wand id_16
);
  wire id_18, id_19;
  always_latch id_7 <= !id_6;
  module_0(
      id_0,
      id_3,
      id_1,
      id_5,
      id_4,
      id_6,
      id_4,
      id_9,
      id_2,
      id_3,
      id_16,
      id_15,
      id_0,
      id_16,
      id_4,
      id_1,
      id_16,
      id_12,
      id_4,
      id_8
  );
  always id_10 <= id_14;
  always
    if (id_8) begin
      $display;
    end
  nand (id_10, id_19, id_15, id_18, id_12, id_5, id_13, id_6, id_2);
endmodule
