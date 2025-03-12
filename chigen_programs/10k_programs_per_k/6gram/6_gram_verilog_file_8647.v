// Seed: 2678491892
module module_0 (
    output wand  id_0,
    output wire  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    output wand  id_4,
    output logic id_5,
    input  tri1  id_6,
    input  tri1  id_7,
    input  wand  id_8
);
  wire id_10;
  always id_5 = #1 id_2;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    output tri id_2,
    output tri0 id_3,
    input supply0 id_4,
    input tri0 id_5,
    output logic id_6
);
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_0,
      id_3,
      id_6,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  function void id_8;
    input [1 : "" ==  1] id_9;
    for (int id_10 = id_4; -1; id_9 = id_0) id_6 <= -1 == id_4;
  endfunction
  assign id_3 = id_0;
  assign id_2 = id_5 ? 1 : id_0 > -1'b0;
endmodule
