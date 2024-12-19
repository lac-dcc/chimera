// Seed: 3147166384
module module_0 (
    input supply0 id_0,
    input tri id_1,
    output tri1 id_2,
    inout wor id_3,
    input wire id_4,
    input tri id_5,
    input tri1 id_6,
    output tri1 id_7,
    output tri id_8,
    input supply0 id_9,
    input tri0 id_10,
    output wire id_11,
    output uwire id_12,
    input uwire id_13,
    input uwire id_14,
    input supply1 id_15,
    input tri1 id_16
);
  wire id_18;
endmodule
module module_1 (
    output supply0 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    output uwire id_4,
    output wire id_5,
    input uwire id_6,
    input supply0 id_7,
    inout wor id_8,
    input tri id_9,
    input supply1 id_10
);
  tri0 id_12 = id_10;
  uwire id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21;
  wire id_22;
  assign id_5 = 1'h0;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_8,
      id_8,
      id_9,
      id_2,
      id_10,
      id_12,
      id_8,
      id_12,
      id_9,
      id_8,
      id_5,
      id_9,
      id_8,
      id_10,
      id_2
  );
  assign modCall_1.id_11 = 0;
  assign id_15 = !id_15;
  assign id_4 = id_6;
  assign id_14 = 1;
  always if (id_3) id_18 = (id_15);
  uwire id_23, id_24 = 1, id_25;
  wire id_26;
  wire id_27 = $display(id_7);
endmodule
