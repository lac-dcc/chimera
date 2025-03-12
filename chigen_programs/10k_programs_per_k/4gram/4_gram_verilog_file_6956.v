// Seed: 4111403164
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3
  );
  always_comb @(1)
    if (1'h0) begin : LABEL_0
      wait (id_3);
    end
  logic id_4;
  ;
  logic id_5;
  ;
  assign id_4 = 1'b0;
  parameter id_6 = 1;
endmodule
