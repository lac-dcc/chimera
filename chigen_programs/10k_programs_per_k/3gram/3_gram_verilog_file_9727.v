// Seed: 3286450159
module module_0 (
    id_1
);
  inout tri1 id_1;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (id_3);
  output wire id_2;
  output logic [7:0] id_1;
  tri0 id_7 = -1;
  always @(posedge 1);
  assign id_1[-1'b0==1'b0] = id_6;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  module_0 modCall_1 (id_1);
  assign modCall_1.id_1 = 0;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    assume (1);
  end
endmodule
