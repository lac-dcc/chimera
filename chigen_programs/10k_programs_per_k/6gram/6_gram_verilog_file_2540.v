// Seed: 1946583551
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output wire id_2,
    input wire id_3,
    input tri0 id_4,
    input tri1 id_5,
    output wor id_6,
    input tri0 id_7,
    output wire id_8,
    input tri1 id_9,
    output supply0 id_10
);
  always @(id_0 or posedge id_3) release id_2;
endmodule
module module_1 (
    input  tri0 id_0,
    output wand id_1
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_8 = 0;
  timeprecision 1ps;
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
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_5;
  id_8(
      .id_0(id_6), .id_1(1), .id_2(id_4 == id_1), .id_3(1), .id_4(id_6), .id_5(id_6), .id_6(1)
  );
endmodule
module module_3 (
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
    id_17
);
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    `define pp_18 0
    id_8 <= 1;
    $display(1'b0 == 1);
    wait (id_12);
  end
  module_2 modCall_1 (
      id_6,
      id_17,
      id_3,
      id_17,
      id_10,
      id_5,
      id_14
  );
endmodule
