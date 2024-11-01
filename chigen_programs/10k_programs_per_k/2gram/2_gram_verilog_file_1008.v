// Seed: 2203531794
module module_0 ();
  assign id_1 = 1;
  reg id_2;
  always_comb begin
    $display(1'b0, 1, 1, id_2 ? id_1 : id_2 - 1, id_2, id_2, 1);
    id_2 <= #1 id_2;
    if (id_1) begin : id_3
      id_1 = ~id_2 + 1;
    end
  end
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri id_4,
    input tri id_5,
    input supply0 id_6,
    input uwire id_7
    , id_28,
    output supply1 id_8,
    output tri1 id_9,
    output tri id_10,
    input wand id_11,
    output supply0 id_12,
    input wand id_13,
    input wor id_14,
    output wire id_15,
    input wire id_16,
    input tri0 id_17,
    output uwire id_18,
    input uwire id_19,
    input wor id_20,
    output wor id_21,
    output uwire id_22,
    input uwire id_23,
    input tri id_24,
    output wand id_25,
    input wire id_26
);
  wire id_29;
  xor (
      id_0,
      id_1,
      id_11,
      id_13,
      id_14,
      id_16,
      id_17,
      id_19,
      id_2,
      id_20,
      id_23,
      id_24,
      id_26,
      id_28,
      id_29,
      id_3,
      id_4,
      id_5,
      id_6,
      id_7);
  module_0();
endmodule
