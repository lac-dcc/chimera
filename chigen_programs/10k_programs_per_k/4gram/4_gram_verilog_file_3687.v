// Seed: 1776495057
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3,
    input wand id_4
);
  assign id_2 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    output logic id_2,
    input logic id_3,
    input tri id_4,
    input supply0 id_5,
    input uwire id_6,
    output wire id_7,
    input wire id_8,
    input logic id_9,
    input logic id_10,
    output logic id_11,
    input logic id_12,
    input tri1 id_13,
    input supply1 id_14,
    input tri1 id_15,
    output uwire id_16,
    output uwire id_17,
    input wor id_18
);
  always #1 begin
    id_0 = id_5 ^ 1;
    id_2 <= id_13 & 1;
  end
  module_0(
      id_4, id_18, id_7, id_5, id_1
  );
  final begin
    assume (id_12.id_9);
    disable id_20;
    id_17 = 1'h0;
    id_20 <= id_3;
    if (1) id_11 <= id_10;
    if ((id_10)) id_2 <= 1;
    else id_20 = 1'b0;
  end
  always @(*) begin
    $display(id_13);
  end
endmodule
