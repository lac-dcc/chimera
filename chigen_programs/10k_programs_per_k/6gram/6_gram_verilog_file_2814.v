// Seed: 3144479532
module module_0 ();
  localparam time id_1 = -1;
  reg [-1 : 1] id_2;
  initial id_2 = #1 -1;
endmodule
module module_1 #(
    parameter id_2 = 32'd67,
    parameter id_4 = 32'd80
) (
    id_1,
    _id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  input wire id_3;
  buf primCall (id_1, id_3);
  inout wire _id_2;
  module_0 modCall_1 ();
  output wire id_1;
  struct packed {
    logic [-1 : -1] id_5;
    struct packed {
      id_6  id_7;
      logic id_8;
    } [{
id_4  ,  id_4
} : {  id_2  {  -1  }  }] id_9;
  } [-1 'b0 : 1] id_10;
endmodule
