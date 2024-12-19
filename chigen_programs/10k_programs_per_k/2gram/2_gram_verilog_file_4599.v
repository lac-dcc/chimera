// Seed: 402259677
module module_0 (
    id_1
);
  inout wire id_1;
  assign module_3.id_4 = 0;
  assign module_2.id_5 = 0;
endmodule
module module_1 (
    output wire id_0
);
  wire id_2;
  module_0 modCall_1 (id_2);
endmodule
module module_2 (
    input tri id_0,
    input supply1 id_1,
    input wor id_2,
    input tri1 id_3
);
  assign id_5 = 1 - id_2;
  module_0 modCall_1 (id_5);
endmodule
module module_3 (
    output supply0 id_0
);
  assign id_0 = id_2 - 1;
  wire id_4;
  wire id_5;
  assign id_4 = id_2 ? 1 : 1;
  module_0 modCall_1 (id_5);
  assign id_0 = ~id_4 ^ 1'b0 ^ id_2;
endmodule
