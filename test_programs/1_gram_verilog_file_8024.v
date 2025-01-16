// Seed: 2119751321
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  inout wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_9  = id_10;
  assign id_10 = id_16;
endmodule
module module_1 (
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  tri0 id_12;
  initial begin : LABEL_0
    begin : LABEL_0
      #1 id_8 <= "" - id_2;
      id_1 = "";
      id_5 <= id_8;
      id_3 = 1 - id_12.id_5;
    end
  end
  tri1 id_13;
  xnor primCall (id_7, id_5, id_11, id_14, id_15, id_12, id_13, id_8, id_6, id_2, id_10);
  wire id_14;
  assign id_7 = id_12;
  assign id_6 = id_14;
  wire id_15;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_12,
      id_14,
      id_2,
      id_2,
      id_7,
      id_15,
      id_12,
      id_13,
      id_10,
      id_7,
      id_7,
      id_13,
      id_2,
      id_10,
      id_11,
      id_13,
      id_15,
      id_7
  );
endmodule
