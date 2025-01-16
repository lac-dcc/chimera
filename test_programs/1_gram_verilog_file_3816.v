// Seed: 1653597040
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    input uwire id_3,
    input wor id_4,
    output uwire id_5,
    output supply0 id_6,
    input wor id_7,
    input tri1 id_8,
    output supply0 id_9,
    input tri1 id_10
);
  wire id_12;
  wire id_13;
  assign id_5 = 1'b0;
endmodule
module module_1 (
    input wire id_0,
    input wor id_1,
    input wire id_2,
    output wire id_3,
    input supply1 id_4,
    input tri0 id_5,
    output tri1 id_6,
    input tri id_7,
    input supply1 id_8,
    output tri id_9,
    input wand id_10,
    input wire id_11,
    input supply1 id_12,
    output supply1 id_13,
    id_21,
    output supply0 id_14,
    input supply1 id_15,
    input wire id_16,
    input wire id_17,
    input wire id_18,
    output tri1 id_19
);
  generate
    tri id_22 = id_17 || id_8;
    begin : LABEL_0
      wire id_23;
    end
  endgenerate
  assign id_22 = -1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_11,
      id_10,
      id_11,
      id_14,
      id_13,
      id_17,
      id_10,
      id_9,
      id_11
  );
  assign modCall_1.type_4 = 0;
  tri0 id_24 = id_11;
endmodule
