// Seed: 160565627
module module_0 ();
  assign module_2.type_0 = 0;
  generate
    if (1'b0) begin : LABEL_0
      assign id_1 = 1'b0;
    end else begin : LABEL_0
      wire id_2;
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3[1'b0] = id_2;
  wire id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  wire  id_0,
    input  uwire id_1,
    output uwire id_2
);
  module_0 modCall_1 ();
endmodule
