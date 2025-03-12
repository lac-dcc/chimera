// Seed: 1066445544
module module_0 (
    output tri id_0,
    output uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    output tri id_4,
    output wand id_5,
    output tri0 id_6,
    input tri id_7,
    input tri0 id_8,
    input tri0 id_9,
    input wor id_10,
    input tri1 id_11
);
  logic [-1 : 1] id_13 = ~id_3 < -1'b0, id_14;
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    input wire id_2,
    input uwire id_3,
    input tri0 id_4,
    output logic id_5,
    input supply0 id_6,
    input tri id_7,
    input supply1 id_8,
    output wire id_9,
    output wand id_10,
    output tri1 id_11
);
  always_latch @(posedge 1'h0) id_5 <= 1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_8,
      id_0,
      id_11,
      id_11,
      id_7,
      id_1,
      id_8,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
