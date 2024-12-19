// Seed: 1651475167
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = 1;
  always @(negedge 1) begin : LABEL_0
    id_1 = 1 > id_2;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = 1'b0;
  wire id_7;
  assign id_2 = id_2;
endmodule
