// Seed: 128550774
module module_0;
  reg id_1;
  initial begin : LABEL_0
    @(posedge 1 or negedge id_1);
  end
  initial begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_1 <= ~id_1;
    end
  end
  assign id_1 = 1;
  reg id_2;
  always @(posedge id_2, posedge id_1) id_1 <= 1'b0;
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
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  tri1 id_8 = 1'b0;
endmodule
