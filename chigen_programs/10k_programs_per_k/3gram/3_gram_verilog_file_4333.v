// Seed: 1444553658
module module_0 (
    input  wor  id_0,
    output tri1 id_1,
    input  tri0 id_2,
    output wand id_3,
    input  wor  id_4,
    input  wand id_5,
    input  wire id_6,
    input  wand id_7
);
  wire id_9;
  ;
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    output tri0  id_2,
    input  tri   id_3,
    output tri0  id_4
);
  logic id_6;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_0,
      id_4,
      id_0,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_7 = 0;
  id_7 :
  assert property (@((id_6)) -1)
  else begin : LABEL_0
    id_1 <= -1'b0;
  end
  assign id_7 = -1;
  and primCall (id_4, id_6, id_3, id_0);
endmodule
