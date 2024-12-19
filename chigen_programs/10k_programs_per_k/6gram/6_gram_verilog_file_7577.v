// Seed: 3364207440
module module_0 (
    input tri0 id_0,
    output tri id_1,
    input wand id_2,
    output supply1 id_3
);
  assign id_1 = id_0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input  tri  id_0,
    input  wand id_1,
    output tri0 id_2
);
  assign id_2 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_2
  );
endmodule
module module_2 (
    output supply0 id_0,
    output logic id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wor id_4,
    output tri id_5
);
  always @(*) begin : LABEL_0
    id_1 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule
