// Seed: 1062062933
module module_0 (
    input supply0 id_0,
    input wire id_1,
    output tri0 id_2,
    output logic id_3,
    output tri0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    output wor id_8,
    output supply1 id_9,
    input wire id_10,
    output supply0 id_11,
    output tri0 id_12,
    input wire id_13,
    input tri id_14
);
  wire id_16 = id_16;
  tri0 id_17;
  assign id_12 = id_14;
  wire id_18;
  wire id_19;
  always @(posedge 1 or negedge 1) id_3 <= 1;
  tri id_20 = 1;
  assign id_17 = 1;
  wire id_21;
  assign module_1.id_0 = 0;
  assign id_9 = id_0;
  assign id_12 = {id_0, 1};
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    output logic id_2,
    input  tri   id_3
);
  always_latch @(posedge id_3) id_2 <= 1'h0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_2,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_3,
      id_0
  );
endmodule
