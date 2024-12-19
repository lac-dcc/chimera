// Seed: 1780595102
module module_0 ();
  logic [7:0] id_1;
  assign id_1[1] = 1;
  wire id_2;
  assign module_2.type_3 = 0;
endmodule
module module_1;
  wire id_1;
  wire id_2;
  module_0 modCall_1 ();
  wire id_3, id_4;
endmodule
module module_2 (
    input  wor   id_0,
    input  wor   id_1,
    input  tri1  id_2,
    input  uwire id_3,
    output wor   id_4
);
  wire id_6;
  wor  id_7;
  module_0 modCall_1 ();
  assign id_7 = (1);
  supply1 id_8 = 1;
endmodule
module module_3 (
    input  logic id_0,
    input  tri1  id_1,
    output logic id_2
);
  initial begin : LABEL_0
    id_2 = 1 ** id_0;
    id_2 = 1'b0;
  end
  module_0 modCall_1 ();
  always @(1'd0 or posedge 1) begin : LABEL_0
    if (id_0)
      @(posedge id_1) begin : LABEL_0
        id_2 <= id_0;
      end
  end
endmodule
