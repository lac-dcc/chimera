// Seed: 1400159040
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
endmodule
module module_2 (
    input  uwire id_0,
    output tri1  id_1,
    output wor   id_2,
    output uwire id_3,
    output tri   id_4
);
  assign module_3.id_6 = 0;
  wand id_6 = id_6 - id_0;
endmodule
module module_3 (
    inout  uwire id_0,
    output tri0  id_1,
    input  wire  id_2,
    output logic id_3,
    output tri0  id_4,
    output uwire id_5,
    input  tri0  id_6,
    input  tri1  id_7
);
  always @(posedge id_2) begin : LABEL_0
    id_3 <= 1;
  end
  module_2 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_0
  );
  assign id_0 = 1;
  assign id_4 = 1 == 1'b0;
endmodule
