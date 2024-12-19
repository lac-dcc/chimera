// Seed: 2945008792
module module_0;
  always @(posedge 1) begin : LABEL_0
    id_1 <= 1 != 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  xnor primCall (id_1, id_2, id_3, id_4, id_5);
  assign id_1 = 1'b0;
  string id_6 = "";
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge 1'h0 or negedge 1'b0) begin : LABEL_0$display
    ;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
