// Seed: 3597615169
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = 1;
  wire id_7;
  assign module_1.type_8 = 0;
  assign id_3 = ({id_2, 1 + id_4, id_6});
endmodule
module module_1 (
    input logic id_0
);
  assign id_2 = 1;
  reg id_3;
  logic id_4, id_5;
  wire id_6;
  initial id_3 = #1 id_0;
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2
  );
  genvar id_7;
endmodule
