// Seed: 2223288997
module module_0 (
    id_1
);
  input wire id_1;
  wire id_2;
endmodule
module module_1 #(
    parameter id_0 = 32'd5
) (
    input wand  _id_0,
    input uwire id_1
);
  always begin : LABEL_0
    wait (id_0);
  end
  localparam id_3 = 1;
  module_0 modCall_1 (id_3);
  integer [id_0 : -1 'b0] id_4;
  reg id_5;
  assign id_5 = 1;
  if (id_3) begin : LABEL_1
    logic id_6 = 1;
  end else begin : LABEL_2
    assign id_5 = id_4 - -1;
  end
  initial
    if (1'b0) id_4 <= 1 == id_4;
    else id_5 <= id_1 == id_3;
endmodule
