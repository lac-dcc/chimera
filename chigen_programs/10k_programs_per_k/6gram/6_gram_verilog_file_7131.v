// Seed: 2837728144
module module_0 (
    output supply0 id_0,
    input tri id_1,
    input wand id_2,
    input tri1 id_3,
    output wor id_4
);
  always @(negedge id_3) begin : LABEL_0
    id_4 = id_1;
    wait (id_1 - 1'd0);
  end
  assign id_0 = id_1;
  assign id_4 = (~id_3);
  wire id_6;
  assign module_1.type_13 = 0;
  assign id_4 = 1'b0 - id_1 - 1;
endmodule
module module_0 (
    output tri0  id_0,
    input  wand  id_1,
    output wire  module_1,
    input  wand  id_3,
    output tri1  id_4,
    input  tri1  id_5,
    output logic id_6,
    output tri0  id_7
);
  initial begin : LABEL_0
    id_6 <= 1;
  end
  xnor primCall (id_6, id_3, id_1, id_5);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_3,
      id_4
  );
endmodule
