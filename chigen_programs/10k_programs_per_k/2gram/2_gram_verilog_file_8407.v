// Seed: 4060281961
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    input tri1 id_6,
    input supply1 id_7,
    output wire id_8,
    input wire id_9,
    input tri1 id_10,
    output wire id_11,
    input uwire id_12
);
  assign id_8 = 1'h0;
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    input supply0 id_2,
    output logic id_3,
    input tri1 id_4,
    input wor id_5,
    input supply0 id_6,
    input wor id_7,
    input supply1 id_8,
    input wor id_9,
    input wire id_10,
    input uwire id_11
    , id_14,
    output supply0 id_12
);
  assign id_12 = id_7;
  generate
    wire id_15;
    always begin : LABEL_0
      id_3 <= id_14 != "";
    end
    tri0 id_16 = 1'b0;
    wire id_17;
  endgenerate
  assign id_14 = 1;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2,
      id_5,
      id_4,
      id_5,
      id_8,
      id_11,
      id_1,
      id_7,
      id_9,
      id_1,
      id_10
  );
  assign modCall_1.id_3 = 0;
endmodule
