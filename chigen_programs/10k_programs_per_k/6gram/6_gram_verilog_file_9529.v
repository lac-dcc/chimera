// Seed: 1411446718
module module_0 ();
  always @(posedge id_1 or ~(id_1))
    if (id_1) begin : LABEL_0
      id_1 <= id_1;
    end
  assign module_2.id_7 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    input  wire id_1,
    output tri  id_2
);
  wire id_4;
  wire id_5;
  wire id_6;
  xnor primCall (id_2, id_4, id_5, id_6, id_7);
  supply0 id_7 = 1 == id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  wor   id_0,
    input  logic id_1,
    output logic id_2,
    input  tri0  id_3,
    input  uwire id_4,
    output logic id_5,
    output wand  id_6,
    input  wand  id_7,
    input  tri   id_8
);
  assign id_2 = id_1;
  always id_5 <= #id_0 id_1;
  module_0 modCall_1 ();
endmodule
