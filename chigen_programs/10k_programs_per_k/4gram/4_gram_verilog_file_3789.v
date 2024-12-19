// Seed: 4046673449
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output uwire id_3
);
  tri1 id_5;
  wire id_6;
  wire id_7;
  assign id_3 = |id_5;
  wire id_8;
  assign id_5 = id_5;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    input wire id_3,
    output wire id_4,
    inout wire id_5,
    output wire id_6,
    input tri0 id_7
);
  wire id_9;
  genvar id_10;
  assign id_1 = 1 - id_7;
  wire id_11;
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_7,
      id_4
  );
  assign modCall_1.id_0 = 0;
endmodule
