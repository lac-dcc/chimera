// Seed: 279766895
module module_0 (
    input wire id_0,
    input wire id_1
);
  always for (id_3 = 1; 1'b0; id_3 = 1'd0) id_3 <= 1;
  assign module_1.type_10 = 0;
  always_ff
    for (id_3 = 1; id_1; id_3 = id_1 - 1) begin : LABEL_0
      id_3 = 1'b0 - 1;
      id_3 <= id_3;
    end
  reg  id_4 = id_3;
  tri0 id_5 = 1;
  wire id_6;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri0  id_1,
    input  wand  id_2,
    output uwire id_3,
    input  tri0  id_4,
    output wand  id_5,
    input  uwire id_6
);
  wire id_8;
  nor primCall (id_5, id_0, id_6, id_2, id_4, id_8, id_1);
  module_0 modCall_1 (
      id_2,
      id_0
  );
endmodule
