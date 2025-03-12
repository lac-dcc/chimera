// Seed: 3150191785
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  localparam id_7 = 1;
  wire id_8;
  initial $signed(70);
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout reg id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_4,
      id_2
  );
  input wire id_2;
  inout wire id_1;
  always @(posedge id_3 != -1 or posedge id_2) begin : LABEL_0
    id_3 <= !id_3 & id_2;
  end
  logic id_5;
  ;
endmodule
