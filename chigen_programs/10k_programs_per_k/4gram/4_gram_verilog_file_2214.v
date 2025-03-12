// Seed: 2238243298
module module_0;
  wire id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd8
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  module_0 modCall_1 ();
  output wire _id_3;
  output wire id_2;
  input wire id_1;
  logic [id_3 : -1] id_9;
endmodule
module module_2 #(
    parameter id_1 = 32'd63
) (
    input wand id_0,
    input wand _id_1
);
  reg [-1  ==  id_1 : 1] id_3;
  logic id_4;
  assign id_3 = 1;
  logic id_5;
  ;
  always_ff @* begin : LABEL_0
    do
    #1 begin : LABEL_1
      id_4 = id_0;
      assert (id_4);
      id_4 = id_0;
      id_3 = !id_3;
      id_4 <= -1'h0;
    end
    while (-1 +
    id_5++
    );
  end
  wire id_6;
  assign id_5 = 1;
  logic [-1 'b0 : 1] id_7;
  localparam id_8 = -1 | -1'd0;
  module_0 modCall_1 ();
endmodule
