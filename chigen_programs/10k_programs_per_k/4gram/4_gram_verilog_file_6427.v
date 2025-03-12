// Seed: 1202983546
module module_0 (
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
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  generate
    tri0 id_8 = 1;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_1
  );
  inout wire id_4;
  output reg id_3;
  output wire id_2;
  inout wire id_1;
  always @(1 or posedge (1)) begin : LABEL_0
    id_3 = id_4;
  end
endmodule
