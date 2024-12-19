// Seed: 1080386708
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    for (id_6 = 1 == 1'd0 > id_4; id_6; id_6 = 1) begin : LABEL_0
      wire id_7;
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_4,
      id_4
  );
  always force id_5 = 1 == 1;
endmodule
