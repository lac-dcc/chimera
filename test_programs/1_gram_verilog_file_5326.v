// Seed: 2826052606
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign module_1.id_4 = 0;
  id_9 :
  assert property (@(posedge 1) 1'b0 ? id_4 : id_4) id_8 = -1;
  wire id_10 = id_2;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1
);
  tri id_4, id_5, id_6;
  final id_0 <= &id_4;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5,
      id_4,
      id_6
  );
  reg id_7, id_8;
  always id_7 <= 1'd0;
  assign id_3 = 1;
endmodule
