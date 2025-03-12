// Seed: 2659008808
module module_0 (
    output tri1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    input wor id_5,
    output logic id_6,
    input tri1 id_7,
    input tri0 id_8,
    input supply1 id_9,
    output wire id_10,
    input supply1 id_11,
    output wire id_12,
    input wor id_13,
    input tri1 id_14
);
  logic id_16;
  ;
  always begin : LABEL_0
    begin : LABEL_1
      id_6 <= id_5;
    end
  end
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    output logic id_4,
    input wire id_5,
    output tri1 id_6,
    input tri0 id_7
);
  always_ff id_4 <= id_1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_0,
      id_3,
      id_1,
      id_4,
      id_5,
      id_3,
      id_3,
      id_6,
      id_7,
      id_6,
      id_3,
      id_2
  );
  assign modCall_1.id_12 = 0;
endmodule
