// Seed: 3764244279
module module_0 (
    input tri0 id_0,
    output uwire id_1,
    output tri1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    output wire id_8,
    input tri id_9,
    input tri1 id_10,
    output tri id_11,
    input supply1 id_12,
    output tri id_13,
    output uwire id_14,
    input uwire id_15,
    input wor id_16,
    output uwire id_17,
    output tri0 id_18
);
  wire id_20;
  assign module_1.type_8 = 0;
  assign id_14 = id_7;
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    output logic id_3,
    output supply1 id_4
);
  initial begin : LABEL_0
    id_3 <= 1;
    #1;
  end
  supply0 id_6 = id_6 ? 1 : 1;
  wire id_7;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_4,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_4,
      id_1
  );
endmodule
