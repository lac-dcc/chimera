// Seed: 1135507103
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8, id_9;
  assign module_1.id_0 = 0;
  wire id_10;
endmodule
module module_1 (
    input wor  id_0,
    input wire id_1
);
  assign id_3 = 1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3
  );
endmodule
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic [7:0] id_4;
  or primCall (id_3, id_2, id_4, id_1);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3
  );
  assign module_2 = 1;
  id_5 :
  assert property (@(posedge id_4[1]) id_5)
  else $display(1);
endmodule
