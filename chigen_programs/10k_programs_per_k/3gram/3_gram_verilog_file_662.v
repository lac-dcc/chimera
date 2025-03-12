// Seed: 3297169847
module module_0 (
    output tri1 id_0,
    output wire id_1,
    input tri1 id_2,
    input supply1 id_3,
    output tri id_4
);
  assign id_0 = id_3;
endmodule
module module_1 (
    output wor id_0,
    output tri0 id_1,
    output logic id_2,
    input tri0 id_3,
    output wand id_4,
    input supply0 id_5,
    output logic id_6,
    input uwire id_7,
    output tri id_8,
    output tri0 id_9,
    input wand id_10,
    output logic id_11,
    output wire id_12
);
  id_14 :
  assert property (@(posedge id_10) id_3)
  else begin : LABEL_0
    id_6  = id_14(1, id_10);
    id_11 = 1;
    $clog2(81);
    ;
    id_2 <= #1 id_7;
  end
  module_0 modCall_1 (
      id_8,
      id_4,
      id_5,
      id_7,
      id_9
  );
endmodule
