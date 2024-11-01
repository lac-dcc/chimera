// Seed: 4281505608
module module_0 (
    input wire id_0,
    input tri0 id_1,
    input wire id_2,
    output wand id_3,
    output tri0 id_4,
    output supply0 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input uwire id_8
);
  tri0 id_10, id_11;
  tri1 id_12 = id_2;
  assign id_11 = 1;
  logic [7:0] id_13;
  assign id_10 = id_11;
  assign id_13[1] = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    inout logic id_5,
    input wand id_6,
    input uwire id_7
);
  always @(negedge 1 or posedge 1) id_5 = #1 id_4 !=? id_0;
  module_0(
      id_7, id_0, id_4, id_2, id_2, id_2, id_1, id_2, id_3
  );
  tri1 id_9;
  always @(posedge id_3 or posedge {id_9{""}} - ~id_5 ^ 1) begin
    assert (id_1);
    id_5 = id_0 + id_7 < 1;
  end
endmodule
