// Seed: 2448746675
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    output supply0 id_3,
    output wor id_4,
    input wire id_5,
    output supply1 id_6,
    output wor id_7,
    input supply0 id_8
);
endmodule
module module_1 (
    input supply1 id_0,
    output supply0 id_1,
    output tri0 id_2,
    input wand id_3
);
  wire id_5, id_6, id_7;
  nand primCall (id_2, id_0, id_6, id_7, id_3, id_5);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always #1;
  id_8(
      .id_0(id_6), .id_1(1), .id_2(~1), .id_3(1'b0), .id_4(-1), .id_5(id_1), .id_6(""), .id_7(id_1)
  );
endmodule
macromodule module_3 (
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
    id_13
);
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wor id_14, id_15;
  wire id_16, id_17, id_18;
  assign id_15 = -1;
  wire id_19;
  tri id_20, id_21, id_22, id_23, id_24;
  assign id_22 = 1;
  wire id_25;
  module_2 modCall_1 (
      id_21,
      id_9,
      id_3,
      id_2,
      id_23,
      id_19,
      id_20
  );
  wire id_26;
  wire id_27;
  assign id_1  = -1;
  assign id_11 = -1;
  wire id_28;
  wire id_29;
  initial id_20 = 1;
  assign id_14 = 1;
  wire id_30;
endmodule
