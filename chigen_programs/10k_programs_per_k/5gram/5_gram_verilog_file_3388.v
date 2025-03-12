// Seed: 3532047757
module module_0 (
    input supply0 id_0,
    output logic id_1,
    input wire id_2,
    input supply1 id_3
);
  timeunit 1ps;
  final begin : LABEL_0
    id_1 = #id_5 id_3;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4,
    output tri0 id_5,
    output logic id_6,
    input tri0 id_7,
    input tri id_8,
    input wor id_9
);
  always_latch @(negedge 1, posedge -1) id_6 = id_0;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9
  );
  assign modCall_1.id_5 = 0;
endmodule
