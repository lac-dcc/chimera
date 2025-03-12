// Seed: 2995248041
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_5;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout reg id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_3,
      id_4
  );
  output wire id_2;
  output wire id_1;
  always @(posedge -1 or negedge id_4) begin : LABEL_0
    id_6 <= -1;
  end
endmodule
