// Seed: 1620054730
program module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_4;
  assign id_6 = id_3;
  assign module_2.id_3 = "";
endmodule
module module_1 ();
  assign id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  wire id_2;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = "";
  id_6 :
  assert property (@(-1) 1) id_5 <= -1;
  always $display(id_1);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_1,
      id_2,
      id_1,
      id_6
  );
endmodule
