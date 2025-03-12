// Seed: 239551117
module module_0 (
    input supply0 id_0,
    output wand id_1,
    output wor id_2,
    input tri1 id_3,
    input tri1 id_4
);
  logic id_6;
endmodule
module module_1 (
    output wor id_0,
    output tri1 id_1,
    output logic id_2,
    output tri id_3,
    input tri1 id_4,
    input uwire id_5,
    output wor id_6,
    input supply1 id_7
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_6,
      id_5,
      id_4
  );
  assign modCall_1.id_2 = 0;
  wire id_9;
  wire id_10;
  always @(-1 or posedge 1) begin : LABEL_0
    id_2 <= 1;
  end
endmodule
