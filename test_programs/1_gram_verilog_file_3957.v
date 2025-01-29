// Seed: 3904847754
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
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  uwire id_7, id_8;
  assign id_3 = 1;
  assign id_7 = id_2 & 1;
  assign #1 id_7 = id_7;
  assign id_3 = 1'b0;
  wire id_9 = id_5;
  wire id_10;
  wire id_12, id_13;
  genvar id_14;
  wire id_15;
  if (-1) assign id_4 = ~id_6;
  wire id_16, id_17;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule
