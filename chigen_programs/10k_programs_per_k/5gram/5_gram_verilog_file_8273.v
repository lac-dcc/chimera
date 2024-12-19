// Seed: 2372383728
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2
    , id_6,
    output wor id_3
    , id_7,
    input tri1 id_4
);
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    output logic id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  wor   id_5,
    input  uwire id_6,
    output uwire id_7,
    output wand  id_8
);
  always @(posedge id_6 or {id_5,
    id_0
  })
  begin : LABEL_0
    id_2 <= 1'b0;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_8,
      id_5
  );
  assign modCall_1.type_11 = 0;
endmodule
