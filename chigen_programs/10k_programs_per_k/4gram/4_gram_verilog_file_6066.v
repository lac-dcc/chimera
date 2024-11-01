// Seed: 3241419838
module module_0 (
    input  tri1  id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output uwire id_4,
    input  tri   id_5,
    input  wand  id_6
);
  logic [7:0] id_8;
  assign id_8[1] = id_0;
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input logic id_2,
    input supply1 id_3,
    input tri1 id_4,
    output logic id_5
);
  always_latch @(posedge id_4)
    if (id_2) id_5 <= #id_3 1'h0;
    else id_5 <= id_2;
  module_0(
      id_3, id_4, id_3, id_1, id_0, id_3, id_4
  );
endmodule
