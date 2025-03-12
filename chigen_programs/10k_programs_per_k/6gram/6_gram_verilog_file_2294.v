// Seed: 3448236289
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    output uwire id_2
    , id_7,
    input tri id_3,
    input wand id_4,
    output supply1 id_5
);
  logic id_8;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    output logic id_5
);
  always @(*) begin : LABEL_0
    id_5 = #id_7 -1 - {id_2, 1};
  end
  module_0 modCall_1 (
      id_1,
      id_4,
      id_0,
      id_3,
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
