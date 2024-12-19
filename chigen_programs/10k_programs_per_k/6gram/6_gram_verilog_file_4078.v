// Seed: 2473978776
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_13 = id_1;
  wire id_14;
  wire id_15 = id_3;
  logic [7:0] id_16;
  string id_17;
  assign id_17 = "";
  wire id_18, id_19;
  assign id_16[1'd0] = 1;
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
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_6;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_1,
      id_7,
      id_7,
      id_6,
      id_7,
      id_7,
      id_1,
      id_1,
      id_8
  );
  assign modCall_1.type_24 = "";
  initial begin : LABEL_0
    wait (1);
    id_5 <= 1'b0;
  end
endmodule
