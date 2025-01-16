// Seed: 1365642464
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  genvar id_2;
  parameter id_3 = 1;
  wire id_4;
  reg  id_5;
  assign id_2 = id_3;
  initial begin : LABEL_0
    id_2 = id_3 ? -1 : 1;
    id_2 <= #1 1;
    id_1 <= id_3;
    id_1 <= #1 -1 - 1 == id_2;
  end
  wire id_6;
  assign id_2 = id_5;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4
  );
endmodule
