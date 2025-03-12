// Seed: 1119579350
module module_0;
  wire id_1;
  ;
  always if ((1 == 1));
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout reg id_3;
  output reg id_2;
  output wire id_1;
  always @(negedge id_4) begin : LABEL_0
    id_3 <= 1;
    if (1) id_2 <= -1;
    else begin : LABEL_1
      id_3 <= id_4;
    end
  end
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_0 = 32'd40,
    parameter id_1 = 32'd78
) (
    output tri _id_0,
    input supply1 _id_1
);
  struct packed {logic [{  1  ,  -1  ,  id_0  ,  id_1  } : id_0] id_3;} id_4 = -1;
  assign id_4 = 1;
  module_0 modCall_1 ();
  logic id_5;
endmodule
