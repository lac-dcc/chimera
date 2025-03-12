// Seed: 2317814353
module module_0;
  logic [-1 'b0 : 1] id_1;
  assign module_2.id_0 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_0 (
    output uwire id_0,
    input  uwire module_1,
    output tri1  id_2,
    input  tri0  id_3
);
  assign id_0 = -1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input tri0 id_0,
    output wor id_1,
    input tri1 id_2,
    input tri1 id_3,
    output supply0 id_4,
    output tri1 id_5,
    output wire id_6,
    output uwire id_7
);
  module_0 modCall_1 ();
endmodule
module module_3 #(
    parameter id_4 = 32'd16,
    parameter id_5 = 32'd74
) (
    output wor   id_0,
    output uwire id_1,
    output logic id_2
);
  assign id_2 = -1'b0 && !(1);
  function void _id_4;
    input [1 : id_4] _id_5;
    input [id_5  |  -1 : -1] id_6;
    begin : LABEL_0
      {-1} <= id_4;
    end
  endfunction
  wire [-1 : (  -1  )] id_7;
  module_0 modCall_1 ();
  specify
    (id_8 + => id_9) = (id_9  : -1  : id_7, id_7  : 1 - id_7  : 1);
    (id_10 => id_11) = 1;
    specparam id_12 = id_9;
  endspecify
  logic [-1 'h0 : -1] id_13 = 1;
  initial begin : LABEL_1
    id_2 <= 1'd0;
    if (-1) $signed(68);
    ;
  end
  initial begin
    _id_4(id_10, id_11);
  end
endmodule
