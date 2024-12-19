// Seed: 1860867265
module module_0 (
    input tri id_0,
    input tri id_1,
    output supply0 id_2,
    input supply1 id_3,
    input wire id_4,
    output wire id_5,
    output tri1 id_6,
    input supply1 id_7,
    input uwire id_8
);
  wire id_10;
  assign id_6 = id_2++;
  generate
    assign id_5 = id_8 + ('d0);
  endgenerate
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input wor id_2,
    input wire id_3,
    input tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    input wor id_7,
    output supply1 id_8,
    output tri0 id_9,
    output logic id_10,
    input wor id_11
);
  initial begin : LABEL_0
    id_10 <= id_5 == id_1;
  end
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_5,
      id_6,
      id_9,
      id_8,
      id_7,
      id_11
  );
  assign modCall_1.type_7 = 0;
endmodule
