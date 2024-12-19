// Seed: 2465169359
module module_0 (
    output uwire id_0,
    input  wire  id_1
);
  assign id_0 = id_1;
  wire  id_3;
  uwire id_4 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    output supply1 id_3,
    output supply0 id_4,
    input tri0 id_5,
    output supply1 id_6,
    input tri id_7,
    input tri id_8,
    input uwire id_9,
    output uwire id_10,
    output wire id_11,
    output logic id_12,
    output supply1 id_13
);
  wire id_15;
  supply1 id_16 = 1, id_17, id_18 = 1'h0, id_19, id_20;
  tri0 id_21;
  always_comb id_12 <= 1'b0;
  wire id_22;
  wire id_23;
  module_0 modCall_1 (
      id_21,
      id_8
  );
  assign modCall_1.id_0 = 0;
  assign #1 id_6 = id_21;
  wire id_24;
  assign id_24 = id_21;
endmodule
