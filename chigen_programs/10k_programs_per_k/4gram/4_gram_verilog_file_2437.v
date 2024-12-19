// Seed: 76022079
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8;
  assign id_7 = id_8;
  wire id_9;
  initial begin : LABEL_0
    id_9 = id_7;
  end
  wire id_10, id_11;
  integer id_12;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_8
  );
endmodule
