// Seed: 2753039752
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  generate
    always @(posedge id_2) begin : LABEL_0
      id_2 <= 1;
      id_3 <= #id_2 1;
    end
  endgenerate
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(1 or posedge id_2 * id_1 * "") begin : LABEL_0
    id_3 <= (1);
  end
  reg id_4;
  assign id_2 = 1'h0;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    id_4 <= 1;
  end
endmodule
