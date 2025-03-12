// Seed: 2206639266
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout logic [7:0] id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5[1] = id_2;
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout logic [7:0] id_7;
  input wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_3,
      id_7,
      id_1
  );
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  import id_8::id_9;
  logic [7:0] id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18;
  assign id_13 = (id_17);
  wire id_19;
  assign id_17[-1] = id_6;
endmodule
