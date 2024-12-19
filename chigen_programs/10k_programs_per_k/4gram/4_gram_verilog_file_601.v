// Seed: 1914685816
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_7 = 1'b0;
  assign module_2.id_6 = 0;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_4,
      id_4,
      id_1,
      id_2,
      id_2,
      id_3
  );
  assign {1, id_2, id_6} = 1;
  id_8 :
  assert property (@(posedge id_8) (id_4))
  else $display(1);
endmodule
