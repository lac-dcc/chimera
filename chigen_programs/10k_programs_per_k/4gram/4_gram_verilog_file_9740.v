// Seed: 3296772243
module module_0 (
    input wor id_0,
    output logic id_1,
    output wire id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wand id_5,
    output supply0 id_6
);
  logic [7:0] id_8;
  initial id_1 = id_0;
  id_9 :
  assert property (@(posedge id_9) id_8[-1])
  else $unsigned(42);
  ;
  assign module_0 = 1;
endmodule
module module_1 (
    output tri1 id_0,
    output tri id_1,
    output uwire id_2,
    input wand id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output logic id_7,
    inout wand id_8,
    output uwire id_9,
    input wand id_10,
    input tri1 id_11,
    input tri0 id_12
);
  initial id_7 = {1{id_6}};
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_0,
      id_12,
      id_5,
      id_8,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
