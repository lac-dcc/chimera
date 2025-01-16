// Seed: 579818468
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5, id_6, id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_5 = id_4;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_5
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
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  tri0 id_8;
  id_9 :
  assert property (@(id_6 or posedge -1) id_8) id_2 <= id_2;
  wire id_10;
  assign id_9 = -1;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_5,
      id_9
  );
endmodule
