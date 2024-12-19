// Seed: 2518488204
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  always @(posedge 1 or 1) begin : LABEL_0
    id_1 = id_3;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_5[1];
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_1,
      id_2
  );
endmodule
