// Seed: 263073380
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  always_ff @(posedge id_1 or posedge 1'd0) begin : LABEL_0
    id_4 = 1;
  end
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2[1] = 1'd0;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_4 = 0;
endmodule
