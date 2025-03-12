// Seed: 3677796636
module module_0 (
    id_1
);
  inout tri id_1;
  assign id_1 = (-1);
  assign module_2.id_1 = 0;
  wire id_2;
  wire id_3;
  id_4(
      id_2
  );
  always begin : LABEL_0
    $unsigned(75);
    ;
  end
endmodule
module module_1 ();
  localparam id_1 = 1'h0;
  module_0 modCall_1 (id_1);
endmodule
module module_2 (
    input  wire  id_0,
    output tri1  id_1,
    output uwire id_2,
    input  tri0  id_3
);
  wire id_5;
  module_0 modCall_1 (id_5);
endmodule
module module_3 #(
    parameter id_6 = 32'd3
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  input wire id_7;
  output wire _id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (id_4);
  output wire id_1;
  struct packed {
    logic id_8;
    logic id_9;
    logic id_10;
    logic [-1 : id_6] id_11;
    logic [-1 'h0 : id_6] id_12;
  } id_13;
  id_14 :
  assert property (@(posedge id_13.id_12) -1)
  else;
  wire id_15;
  ;
  localparam id_16 = 1 ^ -1'b0;
  localparam id_17 = -1;
endmodule
