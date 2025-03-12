// Seed: 2327766678
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    output tri1 id_6,
    input supply0 id_7,
    input supply1 id_8
);
  wire [1 : 1 'b0] id_10;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input wand id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri id_5,
    input wor id_6
);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_2,
      id_5,
      id_3,
      id_4,
      id_5,
      id_2
  );
  assign modCall_1.id_8 = 0;
  initial begin : LABEL_0
    id_1 <= id_2;
  end
endmodule
