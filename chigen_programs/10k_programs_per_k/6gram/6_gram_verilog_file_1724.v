// Seed: 442668896
module module_0 (
    id_1,
    id_2,
    module_0,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_4 or negedge -1) begin : LABEL_0
    $unsigned(99);
    ;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  inout reg id_2;
  inout reg id_1;
  always @(*) begin : LABEL_0
    id_1 <= id_1 & -1'b0 == id_2 & id_2;
    @(posedge id_1);
    id_2 = 1'h0;
  end
  assign id_1 = id_1;
  assign id_2 = 1 ? -1 : id_2;
  assign id_2 = 1'd0 ? -1 : 1;
  assign id_1 = id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
