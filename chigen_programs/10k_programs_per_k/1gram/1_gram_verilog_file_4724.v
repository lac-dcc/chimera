// Seed: 2245579964
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
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  xnor primCall (id_1, id_2, id_3, id_5, id_6, id_7, id_8, id_9);
  module_2 modCall_1 ();
endmodule
module module_1;
  logic id_1;
  ;
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
  assign id_1 = 1'd0;
endmodule
module module_2;
  wire id_1;
  localparam id_2 = 1;
  assign id_1 = id_1;
  id_3 :
  assert property (@(posedge id_2) -1 * 1'h0) $unsigned(28);
  ;
  wire id_4;
  assign id_3 = -1'd0 & -1;
  assign id_3 = id_1;
endmodule
