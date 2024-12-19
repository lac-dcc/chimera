// Seed: 175536695
module module_0 (
    input tri id_0,
    output uwire id_1,
    input supply0 id_2,
    input tri id_3,
    input supply0 id_4,
    input tri1 id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input supply1 id_11,
    input wor id_12,
    input tri0 id_13,
    output supply1 id_14
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wire id_0,
    input tri1 id_1,
    input tri0 id_2,
    output uwire id_3,
    input tri id_4,
    output supply1 id_5,
    output logic id_6
);
  integer id_8;
  always @(*) begin : LABEL_0
    id_6 <= id_8;
    id_8 <= "";
    id_6 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_5,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_1,
      id_3
  );
endmodule
