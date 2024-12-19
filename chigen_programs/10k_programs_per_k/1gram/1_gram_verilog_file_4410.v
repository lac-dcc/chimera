// Seed: 611868325
module module_0 (
    input logic id_0,
    output tri id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output logic id_5,
    input wand id_6,
    input wor id_7
);
  id_9 :
  assert property (@(posedge id_0 or id_6 == id_4) ~1) #1 id_5 <= 1;
  wire id_10;
  assign id_3 = 1 & id_2;
  always id_9 <= id_0;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input supply1 id_2,
    input tri id_3,
    input supply1 id_4,
    input logic id_5,
    output logic id_6,
    inout logic id_7,
    input tri0 id_8,
    input tri0 id_9,
    output supply0 id_10
);
  assign id_6.id_7 = 1;
  wor id_12;
  assign id_10 = 1'b0 && id_12;
  final id_6 <= id_5;
  tri0 id_13, id_14;
  assign id_10 = id_12;
  assign id_13 = 1;
  module_0 modCall_1 (
      id_7,
      id_10,
      id_0,
      id_12,
      id_9,
      id_6,
      id_12,
      id_8
  );
  assign modCall_1.id_4 = 0;
endmodule
