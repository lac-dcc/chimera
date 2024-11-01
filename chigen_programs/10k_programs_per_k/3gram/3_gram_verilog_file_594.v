// Seed: 116459549
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply0 id_2,
    output wand id_3,
    output tri0 id_4,
    input wor id_5,
    output wor id_6,
    input wor id_7,
    input tri0 id_8,
    input wor id_9,
    output uwire id_10,
    input uwire id_11,
    output wire id_12,
    input uwire id_13,
    output tri0 id_14,
    output tri1 id_15,
    input tri0 id_16,
    input tri0 id_17,
    input uwire id_18,
    input tri id_19
);
  initial begin
    id_15 = 1;
  end
  wire id_21;
  always_comb @(*) begin
    $display;
  end
  wire id_22;
  assign id_14 = 1'b0;
  always_ff @(1) begin
    id_12 = 1;
  end
  wire id_23;
endmodule
module module_1 (
    output wire id_0,
    output tri0 id_1,
    output tri0 id_2
);
  wand id_4;
  module_0(
      id_4,
      id_4,
      id_4,
      id_2,
      id_2,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_1,
      id_4,
      id_0,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_2 = id_4;
  wire id_5 = 1;
endmodule
