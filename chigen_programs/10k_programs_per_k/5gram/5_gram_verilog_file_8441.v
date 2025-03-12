// Seed: 1351572024
module module_0 (
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
  input wire id_5;
  inout wire id_4;
  output uwire id_3;
  input wire id_2;
  output wire id_1;
  generate
    if (1 == 1) begin : LABEL_0
      assign id_3 = 1;
      assign id_7 = -1 == "";
    end
  endgenerate
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
  output wire id_1;
  assign id_3 = id_3;
endmodule
