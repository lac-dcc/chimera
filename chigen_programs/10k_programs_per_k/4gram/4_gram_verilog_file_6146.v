// Seed: 65060304
module module_0 ();
  reg id_1 = 1;
  initial begin : LABEL_0
    if (1) begin : LABEL_0
      id_1 = #1 1;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(1) begin : LABEL_0
    id_5 = #1 id_5;
    id_1 = new[id_3] (1);
  end
  module_0 modCall_1 ();
  assign modCall_1.type_2 = 0;
endmodule
