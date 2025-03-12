// Seed: 2312298853
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  assign module_1.id_7 = 0;
  inout tri1 id_2;
  input wire id_1;
  assign id_2 = id_1;
  assign id_2 = 1;
  logic id_6;
endmodule
module module_1 #(
    parameter id_0 = 32'd92,
    parameter id_2 = 32'd2
) (
    input supply0 _id_0
);
  wire [id_0 : 1 'b0] _id_2;
  wire id_3;
  logic [7:0][id_2 : id_0] id_4, id_5;
  integer id_6;
  always id_4[id_2] = -1;
  id_7 :
  assert property (@(-1) id_5) $signed(30);
  ;
  assign id_3 = id_5;
  wire id_8;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_3,
      id_6,
      id_3
  );
endmodule
