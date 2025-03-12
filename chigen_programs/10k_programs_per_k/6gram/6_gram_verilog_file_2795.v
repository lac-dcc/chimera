// Seed: 2631168182
module module_0 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    output tri id_3,
    output tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    input supply0 id_7,
    input wire id_8,
    output tri id_9
);
  wire  id_11;
  logic id_12;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri id_2,
    output supply0 id_3,
    input uwire id_4
    , id_7,
    output logic id_5
);
  supply1 id_8;
  assign id_8 = {-1, id_0};
  always @(posedge id_7 or posedge id_8 & id_4) begin : LABEL_0
    assert (1);
    #1;
    id_5 = id_7;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_2,
      id_3,
      id_4,
      id_1,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
