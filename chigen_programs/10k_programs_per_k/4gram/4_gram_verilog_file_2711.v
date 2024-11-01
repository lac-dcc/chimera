// Seed: 135449974
module module_0 (
    output wand id_0,
    input supply1 id_1,
    output tri1 module_0,
    output uwire id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    output tri id_7,
    output tri1 id_8,
    output uwire id_9,
    output supply1 id_10,
    input wand id_11,
    input tri id_12,
    output wor id_13,
    input wand id_14
);
  assign id_13 = 1;
endmodule
module module_1 (
    output supply1 id_0
    , id_5,
    input tri0 id_1,
    output tri1 id_2,
    output tri0 id_3
);
  tri1 id_6 = 1;
  always_latch @(posedge id_1)
    if (id_5) begin
      id_5 <= id_5 & id_6;
    end
  always @(posedge id_1 or posedge 1'h0) begin
    $display(id_6);
  end
  module_0(
      id_2, id_1, id_2, id_3, id_0, id_1, id_1, id_3, id_2, id_3, id_3, id_1, id_1, id_3, id_1
  );
endmodule
