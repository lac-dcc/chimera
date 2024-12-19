// Seed: 1702795939
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4
  );
  id_5 :
  assert property (@(1) id_1)
  else;
endmodule
module module_2 (
    output wire id_0
);
  assign id_0 = 1;
  assign module_3.type_0 = 0;
  wire id_2;
endmodule
module module_3 (
    output wire id_0,
    input wire id_1,
    input tri0 id_2,
    input wor id_3,
    output tri0 id_4,
    input supply1 id_5,
    input wor id_6,
    input wire id_7
);
  assign id_0 = 1;
  assign id_4 = 1;
  assign id_0 = 1;
  id_9 :
  assert property (@(posedge 1 or id_5) id_3 == 1'b0)
  else;
  module_2 modCall_1 (id_0);
  assign id_4 = id_6;
endmodule
