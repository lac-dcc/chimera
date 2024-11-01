// Seed: 3867590129
module module_0 (
    output supply1 id_0,
    output wor id_1,
    output wor id_2
);
  logic [7:0] id_4;
  assign id_0 = id_4[1'b0==1];
  module_2();
endmodule
module module_1 (
    input  wor  id_0,
    output tri1 id_1
);
  assign id_1 = 1 ? id_0 : 1 ? ~id_0 : id_0;
  module_0(
      id_1, id_1, id_1
  );
endmodule
module module_2;
  always @(id_1) for (id_1 = (id_1 == 1); 1 - id_1; id_1 = 1) $display(1, 1'b0);
endmodule
