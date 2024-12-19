// Seed: 2697293956
module module_0 (
    input wor id_0,
    output supply0 id_1,
    output wor id_2,
    output tri0 id_3
);
  logic [7:0] id_5;
  wire id_6;
  assign id_5[1] = 1'd0;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    input  uwire id_2,
    output logic id_3,
    input  logic id_4,
    input  wand  id_5,
    output wire  id_6
);
  initial begin : LABEL_0
    id_3 <= id_4;
    id_6 = 1;
  end
  xnor primCall (id_0, id_1, id_4, id_5);
  module_0 modCall_1 (
      id_5,
      id_0,
      id_6,
      id_0
  );
endmodule
