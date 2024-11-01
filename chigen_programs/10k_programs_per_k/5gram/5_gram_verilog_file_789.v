// Seed: 2708111038
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    output uwire id_4,
    input supply1 id_5,
    input tri id_6,
    input tri0 id_7
);
  integer id_9, id_10, id_11;
endmodule
module module_1 (
    input  tri0  id_0
    , id_13,
    input  tri   id_1,
    input  uwire id_2,
    output logic id_3,
    output tri0  id_4,
    input  wor   id_5,
    input  wand  id_6,
    output logic id_7,
    input  wire  id_8,
    input  uwire id_9,
    output tri1  id_10,
    input  tri   id_11
);
  assign id_13 = 1 !=? 1;
  always_latch @(posedge 1'h0) begin
    id_7 = #id_14 1;
  end
  always @((id_2 || id_1)) begin
    id_3 <= (id_6 ==? id_1) & 1;
  end
  always_comb @(posedge id_9 or posedge 1) #1;
  supply0 id_15;
  assign id_4 = id_5;
  module_0(
      id_8, id_10, id_4, id_9, id_10, id_9, id_6, id_5
  );
  initial begin
    id_15 = 1;
  end
endmodule
