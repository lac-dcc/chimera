// Seed: 477369953
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_6 = id_3;
  logic [-1 : -1 'd0] id_7;
  assign id_4 = ((id_1));
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    output wand  id_2
);
  wand id_4 = !id_0 == 1'd0 + {id_4, -1, id_0, -1, id_0, id_4, 1, -1, -1, id_0};
  always @(posedge id_0 | id_4) begin : LABEL_0
    id_1 = 1;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
