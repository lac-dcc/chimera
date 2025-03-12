// Seed: 3471013021
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd96,
    parameter id_8 = 32'd86
) (
    id_1,
    id_2,
    id_3,
    _id_4#(.id_5(-1)),
    id_6,
    id_7,
    _id_8
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire _id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_7 = id_4;
  parameter id_9 = 1;
  wire [id_4 : id_8] id_10;
  logic id_11;
  wire id_12;
  assign id_2  = id_9;
  assign id_10 = ~id_8;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_10,
      id_9,
      id_9
  );
  struct packed {
    id_13 id_14;
    logic id_15;
  } id_16;
endmodule
