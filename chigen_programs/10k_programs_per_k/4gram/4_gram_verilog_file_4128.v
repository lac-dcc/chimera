// Seed: 1582030137
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
  genvar id_7;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  assign id_2 = 0;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = 1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
  final begin : LABEL_0
    wait (1);
  end
endmodule
