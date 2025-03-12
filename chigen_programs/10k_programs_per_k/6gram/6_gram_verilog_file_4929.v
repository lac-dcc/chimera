// Seed: 3903581450
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  xnor primCall (id_2, id_6, id_9, id_8, id_11, id_7);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  bit [-1 : -1] id_10;
  tri0 id_11;
  module_0 modCall_1 (
      id_9,
      id_6,
      id_11,
      id_9,
      id_7,
      id_2
  );
  assign id_3 = id_9;
  bit id_12;
  logic [1 : -1 'd0] id_13;
  assign id_11 = 1;
  always @(id_10) begin : LABEL_0
    id_12 <= 1 & -1;
    id_10 <= 1;
    $unsigned(28);
    ;
  end
endmodule
