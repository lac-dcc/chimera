// Seed: 213965000
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire module_0;
endmodule
program module_1 (
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
    id_14
);
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2  = (1);
  assign id_11 = 1;
  nand primCall (id_5, id_13, id_4, id_11, id_7, id_12, id_6, id_2, id_3, id_1);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_7,
      id_5,
      id_12,
      id_6,
      id_13
  );
  initial begin : LABEL_0
    return id_11;
  end
  wire id_15;
  assign id_8 = id_14;
  wire id_16;
  wire id_17;
  id_18(
      .id_0(1), .id_1((id_10)), .id_2(""), .id_3(id_17), .id_4(1)
  ); id_19(
      .id_0(id_17), .id_1(id_10), .id_2(), .id_3(id_2), .id_4(id_14), .id_5(), .id_6(1)
  );
endprogram
