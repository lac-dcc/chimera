// Seed: 2962653444
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = 1'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  always @(1 < id_5 or posedge 1'b0) begin : LABEL_0
    id_4[1'b0] = id_6;
    $display(id_3, 1);
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_3,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule
