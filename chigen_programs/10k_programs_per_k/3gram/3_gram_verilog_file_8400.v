// Seed: 1900857867
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    input supply0 id_2,
    output tri id_3,
    output wor id_4,
    output wand id_5,
    output supply0 id_6,
    input supply1 id_7,
    input supply0 id_8
);
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    output logic id_2,
    output tri1  id_3,
    output wor   id_4,
    output uwire id_5
);
  assign id_2 = -1;
  assign id_4 = -1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_0,
      id_3,
      id_5,
      id_3,
      id_4,
      id_0,
      id_1
  );
  id_7 :
  assert property (@(posedge 1) 1 ? 1 : id_1)
  else begin : LABEL_0
    id_2 = 1;
  end
endmodule
