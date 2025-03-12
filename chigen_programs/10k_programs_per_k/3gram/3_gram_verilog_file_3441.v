// Seed: 2661121166
module module_0;
  wire id_1;
  module_2 modCall_1 ();
endmodule
module module_1 #(
    parameter id_2 = 32'd77,
    parameter id_3 = 32'd23
) (
    id_1,
    _id_2,
    _id_3,
    id_4
);
  inout wire id_4;
  module_0 modCall_1 ();
  inout wire _id_3;
  inout wire _id_2;
  input wire id_1;
  integer id_5["" : (  id_2  )];
  ;
  supply0 id_6 = id_2 - 1;
  struct packed {
    id_7 id_8;
    logic [-1 : id_3] id_9;
  } id_10;
  parameter id_11 = 1;
endmodule
module module_2;
endmodule
module module_3 #(
    parameter id_2 = 32'd29,
    parameter id_3 = 32'd24
) (
    id_1,
    _id_2
);
  input wire _id_2;
  inout wire id_1;
  assign id_1 = id_2#(.id_2(1));
  parameter id_3 = 1'b0;
  logic id_4;
  defparam id_3.id_3 = 1 + -1;
  logic [id_2 : ""] id_5;
  wire id_6;
  ;
  module_2 modCall_1 ();
  id_7 :
  assert property (@(posedge id_5[-1]) id_7)
  else begin : LABEL_0
    id_7 = 1;
  end
endmodule
