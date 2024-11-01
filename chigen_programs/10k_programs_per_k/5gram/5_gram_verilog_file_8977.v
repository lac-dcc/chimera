// Seed: 3572187205
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input supply0 id_2
);
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    input logic id_2,
    input wand id_3,
    output supply0 id_4
    , id_6
);
  logic id_7, id_8;
  assign id_7 = id_2;
  xor (id_4, id_7, id_3, id_0, id_1, id_2, id_8);
  module_0(
      id_1, id_0, id_3
  ); id_9(
      .id_0(1), .id_1(1), .id_2(id_8 >= ~id_7), .sum(id_10 - id_7)
  );
  always @(id_7) id_8 <= id_2;
  always_latch @(1'b0) begin
    assert (id_7 - 1);
  end
endmodule
