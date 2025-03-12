// Seed: 1070727714
module module_0 (
    input supply0 id_0,
    output tri1 id_1,
    output tri0 id_2,
    input uwire id_3,
    input wor id_4,
    output wor id_5,
    output supply1 id_6,
    input uwire id_7,
    input uwire id_8,
    input uwire id_9,
    input wire id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri1 id_13,
    input tri id_14,
    output tri1 id_15,
    input tri1 id_16,
    output wand id_17,
    input uwire id_18
);
  assign id_17 = id_0;
  logic id_20;
  assign module_1.id_16 = 0;
  logic id_21, id_22, id_23, id_24;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input uwire id_5,
    input wand id_6,
    output tri0 id_7,
    input wire id_8,
    output wand id_9,
    input wire id_10,
    output logic id_11,
    input wand id_12,
    input tri id_13,
    input tri0 id_14,
    input wor id_15,
    input supply0 id_16
);
  localparam time id_18 = 1;
  assign id_0 = {-1'b0, -1, id_13};
  module_0 modCall_1 (
      id_4,
      id_9,
      id_0,
      id_2,
      id_2,
      id_7,
      id_7,
      id_10,
      id_6,
      id_10,
      id_5,
      id_15,
      id_15,
      id_12,
      id_10,
      id_0,
      id_3,
      id_7,
      id_8
  );
  always_comb begin : LABEL_0
    id_11 <= id_12;
  end
endmodule
