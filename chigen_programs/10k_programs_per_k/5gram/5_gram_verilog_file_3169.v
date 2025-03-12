// Seed: 1286778405
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
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd51,
    parameter id_7 = 32'd80
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire _id_2;
  output wire id_1;
  wire [-1 : -1] id_6;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_6,
      id_5,
      id_5,
      id_6,
      id_4,
      id_6
  );
  _id_7 :
  assert property (@(posedge -1) -1)
  else $clog2(73);
  ;
  wire [id_2 : id_7] id_8;
endmodule
