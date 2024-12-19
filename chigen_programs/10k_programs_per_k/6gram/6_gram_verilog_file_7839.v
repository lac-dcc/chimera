// Seed: 479353170
module module_0;
  wire id_2;
  assign module_1.type_4 = 0;
  wire id_3;
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    input  logic id_2,
    input  logic id_3,
    output logic id_4
);
  always @(id_1 == id_3 or 1) begin : LABEL_0
    if (id_1 - 1) begin : LABEL_0
      id_0 <= 1;
      #1 id_0 = id_3;
      deassign id_0[1];
    end
  end
  wire id_6;
  assign id_0 = id_2;
  wire id_7;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5 = id_5;
  module_0 modCall_1 ();
  xnor primCall (id_1, id_3, id_5);
endmodule
