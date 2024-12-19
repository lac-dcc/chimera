// Seed: 2022773015
module module_0 (
    input wire id_0,
    output wor id_1,
    output wand id_2,
    output wire id_3,
    input tri0 id_4,
    output supply1 id_5,
    output supply0 id_6
);
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wor id_3,
    output wire id_4,
    input supply1 id_5,
    output wor id_6
);
  supply1 id_8;
  integer id_9;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_2,
      id_5,
      id_4,
      id_6
  );
  assign modCall_1.id_6 = 0;
  for (id_10 = 1; id_3; id_9 = 1) begin : LABEL_0
    assign id_8 = 1;
  end
  id_11 :
  assert property (@(posedge 1) id_0)
  else id_9 <= 1'b0;
endmodule
