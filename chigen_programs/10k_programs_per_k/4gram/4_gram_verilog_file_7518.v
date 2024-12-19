// Seed: 2321806385
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input tri id_2
    , id_13,
    output wand id_3,
    output wire id_4,
    output wand id_5,
    input wor id_6,
    output tri1 id_7,
    output tri0 id_8,
    input supply1 id_9,
    input wand id_10,
    output tri1 id_11
);
  wire id_14;
  id_15(
      .id_0(id_14), .id_1(id_5), .id_2(1), .id_3((1 & id_8)), .id_4(id_11 << 1), .id_5(1)
  );
  assign id_8 = 1;
  wire id_16;
  assign module_1.type_17 = "";
endmodule
module module_1 (
    output uwire id_0,
    output tri   id_1,
    input  wand  id_2,
    input  logic id_3,
    input  uwire id_4,
    input  tri1  id_5,
    input  wor   id_6,
    output wand  id_7,
    output logic id_8
);
  reg id_10;
  final begin : LABEL_0
    id_8 <= id_3;
  end
  wire   id_11;
  string id_12 = "";
  final begin : LABEL_0
    #1;
    fork
      id_1 = id_4;
      $display;
      id_8 <= id_10;
    join_none
  end
  id_13 :
  assert property (@(posedge id_11) id_5)
  else $display(id_2);
  assign id_7 = 1;
  wire id_14;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_5,
      id_11,
      id_7,
      id_7,
      id_5,
      id_13,
      id_11,
      id_2,
      id_4,
      id_0
  );
  assign id_10 = 1'b0;
endmodule
