// Seed: 2198387539
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output wor id_2,
    output wand id_3,
    input tri0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri id_7,
    output tri0 id_8,
    input tri id_9,
    output supply1 id_10
);
  tri0 id_12;
  assign id_12 = 1'd0;
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    output uwire id_2,
    input wand id_3,
    input supply0 id_4,
    output supply0 id_5,
    input logic id_6,
    input tri id_7,
    input wor id_8,
    output uwire id_9,
    input wor id_10,
    input logic id_11
);
  assign id_2 = 1;
  final $display;
  logic id_13;
  initial begin
    id_13 = 1;
  end
  assign id_13 = id_6;
  always @(posedge id_4) id_13 <= id_11;
  logic id_14 = id_13;
  final $display;
  module_0(
      id_8, id_9, id_5, id_9, id_8, id_8, id_4, id_8, id_9, id_3, id_5
  );
endmodule
