// Seed: 3060055960
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = !-1'b0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
  always begin : LABEL_0
    id_2 = #1 -1'h0;
  end
  parameter id_4 = 1;
endmodule
