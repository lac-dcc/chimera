// Seed: 1016408783
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  assign module_1.id_5 = 0;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output tri0 id_2;
  inout wire id_1;
  wire id_7;
  assign id_2 = 1;
  logic [7:0] id_8;
  wire id_9;
  assign id_7 = id_8[1];
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output reg id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  ;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_7,
      id_1
  );
  always @(1) begin : LABEL_0
    id_5 <= 1 * "" - -1;
  end
endmodule
