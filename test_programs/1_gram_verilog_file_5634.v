// Seed: 657912217
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_1,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6, id_7;
  wire id_8;
  wire id_9;
  wire id_10, id_11, id_12;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_9,
      id_5,
      id_9
  );
  assign id_10 = 1;
  wire id_15;
endmodule
