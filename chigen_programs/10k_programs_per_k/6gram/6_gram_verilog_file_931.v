// Seed: 3576493848
module module_0;
  assign id_1 = 1;
  assign module_2.id_1 = 0;
  assign module_1.type_4 = 0;
endmodule
module module_1 ();
  reg id_1;
  reg id_2;
  module_0 modCall_1 ();
  always @(1, posedge id_1) begin : LABEL_0
    for (id_2 = 1; 1; id_2 += id_1) id_2 = 1;
    for (id_1 = id_1; 1; id_1 = id_2) id_1 = 1;
    id_2 <= #1{id_1{1}};
  end
endmodule
module module_2 (
    output tri id_0,
    output wor id_1,
    output supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input uwire id_5,
    input wor id_6,
    input wor id_7,
    input supply0 id_8,
    input supply0 id_9,
    output tri0 id_10,
    input tri0 id_11,
    output uwire id_12
);
  initial assume (id_7);
  module_0 modCall_1 ();
endmodule
