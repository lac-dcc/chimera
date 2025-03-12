// Seed: 2882203644
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign module_1.id_2 = 0;
  logic id_4, id_5;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    output logic id_3,
    input supply0 id_4
);
  logic id_6;
  ;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6
  );
  assign id_3 = -1;
  or primCall (id_3, id_1, id_6, id_4);
  id_7 :
  assert property (@(id_6) ~-1)
  else begin : LABEL_0
    id_3 <= id_6;
  end
  logic id_8;
  ;
  wire id_9;
  ;
  wire id_10;
  ;
endmodule
