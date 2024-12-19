// Seed: 3940798233
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  id_5 :
  assert property (@(posedge id_1) id_2)
  else $display(1 ==? 1);
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1
);
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4,
      id_1
  );
  assign id_4 = id_2 ^ id_6;
endmodule
