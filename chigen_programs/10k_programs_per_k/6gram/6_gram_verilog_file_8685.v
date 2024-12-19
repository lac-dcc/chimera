// Seed: 1589540609
module module_0;
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
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_8;
  initial begin : LABEL_0
    id_7 <= 1;
    id_8 <= id_6 - 1;
    id_3 <= 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  supply0 id_4;
  always @(*) begin : LABEL_0
    id_1 <= 1 >= 1 - (id_4);
  end
  wire id_5;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_6;
  assign id_3 = id_5;
endmodule
