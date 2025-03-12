// Seed: 3521948492
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  localparam id_3 = -1;
  assign id_2 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  input wire id_1;
  xor primCall (id_6, id_5, id_3, id_2, id_4);
  id_7 :
  assert property (@(-1'b0, posedge 1 == id_1) 1)
  else;
endmodule
