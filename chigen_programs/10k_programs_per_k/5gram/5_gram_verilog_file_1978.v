// Seed: 166029865
module module_0 (
    input wor id_0,
    output wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wor id_5,
    output tri id_6,
    output tri id_7,
    input supply1 id_8,
    output supply0 id_9,
    input tri id_10,
    input wand id_11,
    output tri0 id_12,
    output tri0 id_13,
    input supply0 id_14,
    output uwire id_15,
    input uwire id_16,
    input wand id_17,
    output supply0 id_18
);
  assign id_9 = 1;
  wire id_20;
  assign id_1 = id_16;
  reg id_21;
  supply1 id_22 = 1;
  always_comb @(id_8 or 1'h0) begin
    #1 id_21 <= 1;
    id_5 = 1;
  end
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    output wand id_2,
    input tri1 id_3,
    output wand id_4,
    input uwire id_5,
    input tri0 id_6,
    output wor id_7,
    output uwire id_8,
    input wire id_9,
    output tri id_10,
    input tri0 id_11,
    input supply0 id_12,
    input tri id_13,
    input uwire id_14,
    output wire id_15,
    output tri1 id_16,
    output uwire id_17
);
  assign id_7 = id_9 ? id_14 : 1'b0;
  wire id_19;
  module_0(
      id_9,
      id_10,
      id_6,
      id_5,
      id_1,
      id_8,
      id_4,
      id_10,
      id_9,
      id_2,
      id_14,
      id_13,
      id_10,
      id_10,
      id_11,
      id_10,
      id_5,
      id_12,
      id_10
  );
endmodule
