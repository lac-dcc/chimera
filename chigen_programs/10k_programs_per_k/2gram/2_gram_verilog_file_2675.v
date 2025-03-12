// Seed: 2376774255
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    input tri0 id_3,
    output tri1 id_4,
    output logic id_5,
    input wire id_6
);
  bit id_8;
  assign id_8 = id_0#(
      .id_0(1 - 1),
      .id_6(1),
      .id_1(1'b0),
      .id_8(-1),
      .id_2(1'b0),
      .id_1(1 - 1),
      .id_6(1)
  );
  parameter id_9 = 1'd0;
  always begin : LABEL_0
    id_5 <= 1;
    id_8 <= id_3;
  end
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    output logic id_2,
    input tri1 id_3,
    output wor id_4,
    input tri id_5,
    output uwire id_6,
    input wire id_7,
    output wor id_8,
    input supply1 id_9,
    input tri1 id_10,
    input wor id_11
);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_9,
      id_5,
      id_6,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
  final begin : LABEL_0
    id_2 <= id_10;
  end
  assign id_6 = 1 | -1 | -1'b0 == id_11;
  wire [-1 'b0 : -1] id_13;
  logic [1 : 1] id_14;
  ;
  always cover ("");
  wire id_15;
  wire id_16;
  logic [1 'b0 : 1] id_17;
  ;
endmodule
