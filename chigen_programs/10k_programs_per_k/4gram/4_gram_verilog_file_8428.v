// Seed: 3606906457
module module_0 (
    input wor id_0,
    output wor id_1,
    input supply0 id_2,
    output tri id_3
);
  logic id_5;
  assign id_3 = id_2;
endmodule
module module_1 (
    input  wand  id_0,
    output uwire id_1
    , id_5,
    input  tri1  id_2,
    input  wire  id_3
);
  logic id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_1
  );
  always @(id_5) id_6 = -1'h0;
  initial begin : LABEL_0
    id_6 = -1 - 1'b0;
    fork
      `define pp_7 0
      #1;
      `pp_7 <= 1'h0 ==? -1;
      `pp_7 = 1;
      id_6  = id_5;
      id_8(1);
    join
  end
endmodule
