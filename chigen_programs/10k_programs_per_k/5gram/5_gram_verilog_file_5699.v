// Seed: 3513164290
module module_0 ();
  logic id_1;
  ;
  assign id_1 = 1'h0;
  assign module_1._id_0 = 0;
  wire id_2, id_3;
endmodule
module module_1 #(
    parameter id_0 = 32'd98
) (
    input  tri1  _id_0,
    output logic id_1,
    input  tri   id_2
);
  parameter id_4 = -1;
  module_0 modCall_1 ();
  always @(posedge id_4)
    if (1'd0) begin : LABEL_0
      wait (1 == id_4);
    end
  generate
    for (id_5 = (id_2) == id_0; ~id_4; id_1 = -1) begin : LABEL_1
      assign id_1 = id_4[id_0];
      always @(posedge -1'b0 or posedge 1 ==? -1) id_5 = id_2;
    end
  endgenerate
endmodule
