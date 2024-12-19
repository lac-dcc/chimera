// Seed: 1529058772
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    input tri1 id_4
);
  integer id_6;
  wor id_7;
  assign module_1.type_9 = 0;
  initial if (1'b0 % id_0) id_6 <= 1;
  wand id_8;
  wor  id_9 = id_7;
  tri0 id_10, id_11, id_12, id_13;
  assign id_10 = id_9;
  wire id_14 = 1;
  assign id_14 = id_10 ? id_11 : id_11 ? 1 : id_4 - id_2;
  wire id_15;
  wire id_16;
  assign id_7 = id_8;
  wire id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26;
  tri0 id_27 = id_9;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input wor id_2,
    output tri1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output wor id_6,
    input tri1 id_7,
    output wor id_8,
    output uwire id_9,
    output supply0 id_10,
    input uwire id_11,
    input wor id_12,
    input uwire id_13,
    input tri0 id_14,
    input wand id_15,
    input wor id_16
    , id_24,
    input wor id_17,
    output logic id_18,
    input supply1 id_19,
    input wor id_20,
    input tri1 id_21,
    output tri1 id_22
);
  initial begin : LABEL_0
    id_3 = 1;
    if (1 == 1) begin : LABEL_0
      id_18 = #1 1;
      id_18 <= 1'b0;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_10,
      id_13,
      id_6,
      id_16
  );
endmodule
