// Seed: 2959132253
module module_0 (
    output wire id_0,
    input tri id_1,
    input tri id_2,
    input tri0 id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri0 id_6
    , id_19,
    input wire id_7,
    input wand id_8,
    input wand id_9,
    input wand id_10,
    input supply0 id_11,
    input supply1 id_12,
    output wand id_13,
    input wand id_14,
    input tri id_15,
    input wand id_16,
    input supply1 id_17
);
  assign id_0 = 1 >> id_11;
  assign module_1.id_1 = 0;
  id_20 :
  assert property (@(posedge id_7) -1)
  else $unsigned(91);
  ;
endmodule
module module_1 (
    output logic id_0,
    output uwire id_1,
    output tri0  id_2,
    output wand  id_3,
    input  wand  id_4
);
  final begin : LABEL_0
    id_0 = #1 id_4;
  end
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
