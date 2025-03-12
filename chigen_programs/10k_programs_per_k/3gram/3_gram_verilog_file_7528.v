// Seed: 2328391613
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  assign module_1.id_5 = 0;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_13 :
  assert property (@(id_11) -1)
  else begin : LABEL_0
    if (1) $unsigned(17);
    ;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd68
) (
    _id_1,
    id_2
);
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  output wire _id_1;
  localparam id_3 = 1;
  logic [-1 'b0 : id_1] id_4;
  tri0 id_5, id_6 = 1 == id_4 < 1;
  wire id_7;
  assign id_7 = id_4;
  always @(posedge 1) id_4 <= -1;
endmodule
