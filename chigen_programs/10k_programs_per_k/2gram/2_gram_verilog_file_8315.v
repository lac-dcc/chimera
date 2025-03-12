// Seed: 2669140413
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input tri0 id_3
);
  parameter id_5 = (1);
  reg id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  always id_10 <= id_3;
  pullup (1);
  wire [-1 'b0 : -1] id_18;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input tri id_6
);
  logic id_8;
  ;
  localparam id_9 = (1);
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_0
  );
  assign modCall_1.id_13 = 0;
endmodule
