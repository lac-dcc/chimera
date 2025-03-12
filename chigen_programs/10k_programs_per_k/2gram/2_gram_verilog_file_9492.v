// Seed: 3239875417
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri id_7,
    input supply1 id_8
    , id_10
);
  final id_10 = 1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    output logic id_5,
    input tri id_6,
    input tri0 id_7
);
  always
    assume (id_4) begin : LABEL_0
      id_5 = 1;
    end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_6,
      id_4,
      id_1,
      id_6,
      id_3
  );
endmodule
