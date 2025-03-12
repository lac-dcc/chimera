// Seed: 2097141535
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wand id_1;
  logic id_5;
  ;
  always @(id_2)
    if (1) begin : LABEL_0
      id_6.id_7.id_8;
    end
  assign id_1 = -1;
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  wor   id_2,
    output logic id_3,
    input  uwire id_4,
    output wor   id_5,
    input  tri   id_6
);
  localparam id_8 = 1 * -1;
  assign id_3 = id_0;
  wire [-1 : 1] id_9;
  parameter id_10 = id_8;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_9
  );
  assign modCall_1.id_1 = 0;
  assign id_5 = id_1;
  initial begin : LABEL_0
    #1;
    id_3 <= id_2#(.id_11(id_10));
  end
endmodule
