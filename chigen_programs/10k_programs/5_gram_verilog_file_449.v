// Seed: 2704860148
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output wand id_2,
    output wor id_3,
    output uwire id_4,
    input wand id_5,
    output tri1 id_6,
    output wire id_7
    , id_18,
    output tri0 id_8,
    output tri0 id_9,
    output tri0 id_10,
    input wor id_11,
    input tri id_12,
    input tri0 id_13,
    output tri id_14,
    input supply1 id_15,
    input uwire id_16
);
  assign id_18[1] = id_12;
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input wire id_2,
    input wand id_3,
    input supply0 id_4,
    input supply1 id_5,
    input logic id_6,
    input wor id_7
);
  always
  fork
    id_9 <= id_9++;
    id_10(1'b0 || -(id_0) == id_0 || id_1);
    id_11(id_4 == 1'b0);
  join : id_12
  module_0(
      id_10,
      id_3,
      id_10,
      id_10,
      id_10,
      id_4,
      id_10,
      id_10,
      id_10,
      id_10,
      id_10,
      id_1,
      id_4,
      id_0,
      id_10,
      id_0,
      id_4
  );
  uwire id_13 = 1;
  assign id_10 = id_3;
  always @(negedge 1) begin
    id_9  <= id_6;
    id_11 <= id_10 ==? 1;
    $display(1 == id_11, 1, id_5);
  end
endmodule
