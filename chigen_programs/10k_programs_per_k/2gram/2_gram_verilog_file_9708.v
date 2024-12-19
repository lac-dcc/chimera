// Seed: 3995821909
module module_0 (
    output uwire id_0,
    output tri   id_1
);
  always_latch @(posedge 1) id_0 = id_3;
  assign id_0 = id_3 ==? 1;
  wire id_4;
  assign id_0 = id_3;
  wire id_5;
  wire id_6;
  tri1 id_7 = id_3;
  wire id_8;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input logic id_2,
    input wire id_3,
    input logic id_4,
    input tri1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    output wire id_8,
    output tri0 id_9,
    output logic id_10,
    output tri1 id_11,
    output wor id_12,
    input tri0 id_13,
    output uwire id_14,
    input supply1 id_15,
    input tri id_16
);
  always begin : LABEL_0
    wait (id_5);
    id_14 = 1;
    id_10 <= id_2;
  end
  module_0 modCall_1 (
      id_14,
      id_11
  );
  assign modCall_1.id_7 = 0;
  assign id_10 = id_4;
endmodule
