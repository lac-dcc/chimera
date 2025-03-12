// Seed: 2598793745
module module_0 (
    id_1,
    id_2#(.id_3(-1)),
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_15;
  inout wire id_14;
  inout wand id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout uwire id_1;
  logic id_17 = id_5 * id_14;
  wire [-1 'b0 : -1] id_18;
  always begin : LABEL_0
    $unsigned(76);
    ;
  end
  assign id_1  = -1 <-> -1;
  assign id_13 = 1'd0;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    input  uwire id_2
);
  always_comb begin : LABEL_0
    @(posedge 1 or posedge id_2) id_0 <= id_1;
    id_0 <= (id_1);
  end
  parameter id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  wire id_5;
endmodule
