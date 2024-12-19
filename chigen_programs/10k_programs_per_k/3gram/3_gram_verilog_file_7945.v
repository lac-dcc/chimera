// Seed: 2522660762
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri id_4,
    input wor id_5,
    output wand id_6,
    output supply0 id_7
    , id_9
);
  module_2 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.id_5 = 0;
  assign module_1.id_2  = 0;
  always @(posedge 1);
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wand id_2,
    output tri0 id_3
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_5 :
  assert property (@(posedge 1) 1)
  else begin : LABEL_0
    cover (1);
  end
endmodule
