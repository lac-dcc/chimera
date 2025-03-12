// Seed: 1743453331
module module_0;
endmodule
module module_1;
  logic [-1 : -1] id_1;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_2 = 32'd28,
    parameter id_4 = 32'd57
) (
    id_1,
    _id_2,
    id_3,
    _id_4
);
  output wire _id_4;
  input wire id_3;
  input wire _id_2;
  output wire id_1;
  struct packed {
    logic [(  id_2  ) : 1] id_5;
    logic [id_4 : ""] id_6;
  } id_7;
  module_0 modCall_1 ();
endmodule
program module_3 #(
    parameter id_2 = 32'd39
) (
    input  tri1  id_0,
    output wand  id_1,
    input  wand  _id_2,
    output uwire id_3
);
  always @(-1'b0 == id_2) begin : LABEL_0
    $signed(81);
    ;
  end
  assign id_3 = id_0;
  module_0 modCall_1 ();
  logic [id_2 : 1 'b0] id_5;
  ;
  assign id_5 = id_2;
endprogram
