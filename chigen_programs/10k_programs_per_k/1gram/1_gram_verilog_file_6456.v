// Seed: 1719744728
module module_0 ();
  reg id_1 = 1, id_2 = id_1;
  always
    if (1)
      if (!1) id_1 <= -1'b0;
      else begin : LABEL_0
        id_1 <= id_2;
        id_2 = id_2;
      end
    else assign id_2 = ~&id_1;
  assign id_1 = id_2;
endmodule
module module_1 #(
    parameter id_9 = 32'd85
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10
);
  input wire id_10;
  input wire _id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  module_0 modCall_1 ();
  assign id_1[-1] = id_9;
  assign id_2 = 1'b0;
  wire [1  ?  1 : 1 : !  -1 'b0] id_11;
  wire [1 'b0 &&  -1 : id_9] id_12;
endmodule
