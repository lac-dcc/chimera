// Seed: 2320538091
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input tri id_2,
    input supply1 id_3,
    output uwire id_4,
    input wand id_5
);
  assign id_4 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output logic id_1,
    input tri0 id_2,
    input tri0 id_3,
    output logic id_4,
    output tri1 id_5,
    output tri0 id_6,
    input tri id_7,
    input supply0 id_8
);
  wire id_10;
  always id_4 = new(1);
  always
    if (id_7) begin : LABEL_0
      id_1 <= ~1;
    end
  xor primCall (id_5, id_0, id_7, id_2, id_8, id_10, id_3);
  module_0 modCall_1 (
      id_7,
      id_0,
      id_7,
      id_8,
      id_5,
      id_0
  );
  assign modCall_1.type_7 = 0;
endmodule
