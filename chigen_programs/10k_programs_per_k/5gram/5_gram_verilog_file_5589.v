// Seed: 3395720984
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  wire id_5;
  assign id_2[-1] = -1;
  pulldown (1'h0, id_1);
  wire id_6;
  wire id_7;
endmodule
module module_1 #(
    parameter id_6 = 32'd30
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  inout logic [7:0] id_9;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_5,
      id_2
  );
  output wire id_8;
  output wire id_7;
  output wire _id_6;
  input wire id_5;
  inout wire id_4;
  output reg id_3;
  inout wire id_2;
  output wire id_1;
  wire [1 : -1] id_10;
  logic [1 : id_6] id_11, id_12;
  assign id_9[1] = id_12 !=? 1'd0;
  initial begin : LABEL_0
    if (1)
      if (1) begin : LABEL_1
        id_3 <= -1 != (-1);
      end else assert (id_10) $unsigned(8);
    ;
  end
  wire id_13;
  wire [1 : 1 'h0] id_14;
endmodule
