// Seed: 2402086878
module module_0 (
    output wor id_0,
    output wire id_1,
    output supply0 id_2,
    output supply0 id_3,
    input wor id_4,
    output tri0 id_5,
    input tri1 id_6,
    output tri0 id_7
);
  wire id_9;
  id_10 :
  assert property (@(negedge id_10) id_6)
  else $display(1);
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    output wire id_3,
    input supply1 id_4,
    output wor id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_2,
      id_3,
      id_1,
      id_5
  );
  assign modCall_1.id_4 = 0;
  wire id_8;
endmodule
