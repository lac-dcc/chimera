// Seed: 3984924327
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    input wor id_3,
    input supply1 id_4,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    input tri0 id_8
);
  assign id_0 = id_5;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input supply0 id_3,
    output wand id_4,
    output tri id_5,
    input wor id_6,
    output wire id_7,
    output tri1 id_8,
    output wire id_9,
    input wire id_10,
    output supply1 id_11,
    output tri id_12,
    input tri id_13,
    output supply0 id_14
);
  always_latch @(posedge 1) begin
    id_4 = 1'h0 & id_1 & 1;
    return id_1;
  end
  module_0(
      id_8, id_11, id_3, id_13, id_2, id_2, id_0, id_2, id_1
  );
endmodule
