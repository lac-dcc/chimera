// Seed: 3146707607
module module_0 #(
    parameter id_1 = 32'd6,
    parameter id_2 = 32'd85
) ();
  logic [1 'b0 : 1 'b0] _id_1;
  logic _id_2;
  struct packed {
    logic [1 : -1] id_3;
    id_4 id_5;
  } id_6;
  assign id_6 = id_2 == -1'b0 ? id_1 : -1;
  assign id_6 = id_1 ? id_1 ~^ -1'b0 : id_2 & id_2;
  assign id_6.id_3 = id_6.id_3;
  wor [id_1  ==  id_2 : id_2] id_7;
  assign id_7 = id_2 || 1'b0;
  assign id_1 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input logic [7:0] id_6;
  inout wire id_5;
  inout uwire id_4;
  input wire id_3;
  output reg id_2;
  output wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    $clog2(70);
    ;
    for (id_4 = id_3; id_3; id_2 = id_6['d0 :-1'b0]) begin : LABEL_1
      SystemTFIdentifier((1), 1);
      assert (id_7);
    end
  end
endmodule
