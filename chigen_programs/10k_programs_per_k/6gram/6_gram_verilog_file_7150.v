// Seed: 1515718587
module module_0;
  tri1  id_1;
  uwire id_2;
  wire  id_3;
  module_2 modCall_1 ();
  wire id_4 = 1 == id_1;
  assign id_2 = 'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always id_4 <= #1 1;
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
endmodule
module module_2;
  assign module_0.type_5 = 0;
  assign id_1[""] = 1'd0;
  always @(posedge 1) begin : LABEL_0$display
    ;
  end
endmodule
