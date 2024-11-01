// Seed: 3721792398
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri id_4,
    output wor id_5,
    input tri1 id_6,
    input tri id_7,
    input supply1 id_8,
    output supply0 id_9,
    output wor id_10,
    input wire id_11
    , id_24,
    input wand id_12,
    input tri id_13,
    input uwire id_14,
    input uwire id_15,
    input wor id_16,
    input wor id_17,
    input wand id_18
    , id_25,
    output supply1 id_19,
    output wand id_20,
    output wire id_21,
    input wand id_22
);
  tri id_26 = 1'd0;
endmodule
module module_1 (
    output supply0 id_0,
    input tri id_1,
    output tri0 id_2,
    input supply1 id_3
);
  assign id_2 = 1;
  tri1 id_5 = 1;
  module_0(
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_3
  );
  supply0 id_6 = 1;
  always_latch @(posedge id_6) begin
    cover (1);
  end
endmodule
