// Seed: 3203096026
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wor id_5,
    output tri id_6,
    output tri id_7,
    output wand id_8,
    output supply1 id_9,
    input wire id_10,
    output wand id_11,
    output tri0 id_12,
    input tri0 id_13,
    output tri id_14,
    output supply1 id_15
);
  assign id_14 = 1;
endmodule
module module_1 (
    input  tri   id_0,
    input  wor   id_1,
    input  uwire id_2,
    output wor   id_3,
    input  uwire id_4
);
  assign id_3 = id_0;
  module_0(
      id_0, id_2, id_3, id_4, id_0, id_3, id_3, id_3, id_3, id_3, id_2, id_3, id_3, id_0, id_3, id_3
  );
  always_latch @(posedge id_0 or posedge id_4) begin
    $display(id_2, 1'b0);
  end
  always @(1 or posedge id_0) begin
    id_3 = 1;
  end
  wire id_6;
endmodule
