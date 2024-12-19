// Seed: 1384340261
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always @(id_2 < 1) id_1 = #(id_2) "";
  reg id_3 = id_2 == 1;
  assign id_1 = 1'h0 - id_1;
  assign {id_2, 1} = id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  always @(1 == 1'b0 - id_1) begin : LABEL_0
    id_3 <= 1;
  end
  wire id_5;
  wire id_6;
endmodule
