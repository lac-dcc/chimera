// Seed: 1219469676
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output supply0 id_2,
    input tri1 id_3,
    output wor id_4,
    output supply0 id_5,
    output tri0 id_6,
    output wor id_7,
    output supply1 id_8,
    input wor id_9
);
  assign module_1.type_3 = 0;
  always @(negedge 1 or id_9) begin : LABEL_0$display
    ;
  end
  always force id_7 = 1;
  assign id_0 = id_1;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input wire id_2,
    output supply0 id_3,
    output supply1 id_4
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_1,
      id_3,
      id_3,
      id_0,
      id_4,
      id_3,
      id_2
  );
  assign id_4 = 1;
endmodule
