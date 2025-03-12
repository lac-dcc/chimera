// Seed: 2588753280
module module_0 (
    input tri1 id_0[1 : 1],
    input supply0 id_1,
    output tri id_2,
    input uwire id_3,
    input tri id_4,
    input wor id_5,
    input uwire id_6,
    output uwire id_7,
    output uwire id_8,
    input wire id_9,
    input tri id_10
);
  wire id_12, id_13;
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1[-1  < "" : -1 'b0],
    output logic id_2,
    input tri id_3
);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_9 = 0;
  always_latch id_2 = 1 & 1;
  assign id_1 = id_3 << -1;
endmodule
