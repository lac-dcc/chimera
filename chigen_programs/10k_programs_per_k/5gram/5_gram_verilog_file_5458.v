// Seed: 3668117293
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  reg id_3, id_4;
  assign id_4 = id_1;
  initial begin : LABEL_0
    id_1 <= 1;
  end
  wire id_5;
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
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_5
  );
  assign modCall_1.id_1 = 0;
  always @(*) if (1) if (1 == id_4) id_6 <= #id_4 id_5 + 1;
endmodule
