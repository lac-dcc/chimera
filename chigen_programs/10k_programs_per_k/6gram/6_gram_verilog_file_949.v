// Seed: 2398211837
module module_0;
  always @(posedge id_1) id_1 <= 1;
endmodule
module module_1 (
    output logic id_0,
    output tri1  id_1
    , id_4,
    input  logic id_2
);
  generate
    for (genvar id_5 = 1 & 1; id_2; id_0 = 1) begin : LABEL_0
      reg id_6 = 1 - 1;
      always @(1'd0) repeat (id_2 - 1) id_6 = #1 1 - id_4;
    end
  endgenerate
  always @(posedge id_2 or id_2 != 1) begin : LABEL_0
    id_0 <= id_2;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
