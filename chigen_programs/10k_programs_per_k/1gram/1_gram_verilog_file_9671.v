// Seed: 400379274
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1;
  supply0 id_6 = 1 & id_2, id_7;
  wire id_8, id_9;
  wire id_10, id_11, id_12, id_13, id_14;
  wire id_15;
  wire id_16;
  assign id_3 = id_14;
endmodule
module module_1 (
    output wire id_0
);
  wire id_2;
  reg  id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_1 = 0;
  wire id_4;
  initial @(posedge id_4) id_3 <= 1;
endmodule
