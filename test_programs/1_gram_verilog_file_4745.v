// Seed: 2250025179
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = (~id_3);
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
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always_comb begin : LABEL_0
    begin : LABEL_0
      id_7 <= -1;
    end
    if (-1) id_7 <= 1'b0;
  end
  module_0 modCall_1 (
      id_1,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
