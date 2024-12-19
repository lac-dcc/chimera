// Seed: 3878855114
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4,
    input tri id_5,
    input supply1 id_6,
    output wire id_7,
    input wor id_8,
    input wor id_9,
    output uwire id_10
);
  assign id_0 = id_5;
  wire id_12;
  wire id_13;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input wor id_2,
    input supply0 id_3,
    input wire id_4
);
  assign id_1 = 1'h0;
  specify
    if (id_0 & 1 && id_4) (id_6 => id_7) = (id_3);
  endspecify
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_2,
      id_6,
      id_0,
      id_6,
      id_1,
      id_2,
      id_6,
      id_1
  );
  tri0 id_8 = 1 == id_0;
endmodule
