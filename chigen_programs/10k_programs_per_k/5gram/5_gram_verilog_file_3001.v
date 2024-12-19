// Seed: 37151495
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4,
    output wire id_5
);
  id_7 :
  assert property (@(posedge 1'b0) id_3)
  else $display(id_0, 1);
endmodule
module module_1 (
    output tri0 id_0,
    input  tri  id_1,
    output tri0 id_2,
    input  tri1 id_3
);
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 (
    input  wor   id_0
    , id_7,
    output tri0  id_1,
    input  wand  id_2,
    input  tri0  id_3
    , id_8,
    input  tri1  id_4,
    output logic id_5
);
  initial begin : LABEL_0
    id_5 <= id_8;
    id_7 = 1 != id_3;
  end
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_0,
      id_3,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
