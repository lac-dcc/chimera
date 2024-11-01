// Seed: 383632068
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    output tri id_5,
    output logic id_6,
    output wand id_7,
    input supply0 id_8,
    input tri id_9,
    input wand id_10,
    output uwire id_11,
    input tri id_12,
    input wor id_13,
    output supply1 id_14,
    output supply1 id_15,
    input wire id_16,
    input tri1 id_17,
    output wor id_18,
    input wor id_19,
    input supply1 id_20,
    input tri id_21
);
  assign id_15 = id_10;
  wire id_23;
  always @(posedge 1) begin
    id_6 = #id_24 1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input uwire id_3,
    output wire id_4,
    output wand id_5,
    output supply1 id_6,
    output wor id_7,
    output logic id_8,
    output logic id_9,
    input wor id_10,
    input wire id_11,
    output wand id_12,
    input wand id_13,
    input tri id_14,
    input wand id_15,
    output wand id_16,
    output tri0 id_17,
    input wire id_18,
    output supply1 id_19,
    output supply1 id_20,
    input wand id_21,
    input wor id_22,
    output tri id_23,
    output tri0 id_24,
    output tri id_25,
    output wand id_26,
    input tri id_27,
    input logic id_28,
    output tri0 id_29,
    input tri1 id_30,
    input wor id_31
);
  generate
    always_ff
      if (id_1) id_9 <= id_28;
      else id_8 <= ~1;
  endgenerate
  module_0(
      id_4,
      id_31,
      id_27,
      id_10,
      id_31,
      id_5,
      id_8,
      id_19,
      id_14,
      id_3,
      id_14,
      id_25,
      id_10,
      id_18,
      id_24,
      id_20,
      id_21,
      id_3,
      id_23,
      id_1,
      id_2,
      id_27
  );
endmodule
