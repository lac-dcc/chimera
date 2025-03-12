// Seed: 2914126964
module module_0 ();
  wire  id_1;
  logic id_2;
  ;
  final begin : LABEL_0
    if (1) id_2 = id_1;
    else disable id_3;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd45,
    parameter id_6 = 32'd25,
    parameter id_8 = 32'd94
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  inout wire _id_1;
  wire  _id_6;
  logic id_7;
  ;
  tri0 _id_8 = -1;
  logic [7:0][id_1  &  -1 : id_6] id_9;
  logic id_10;
  and primCall (id_2, id_3, id_4, id_7, id_9);
  wire id_11;
  always_ff @(id_4 or posedge 1)
    if (1) begin : LABEL_0
      #1 id_7 <= 1;
    end else begin : LABEL_1
      if (1) id_4[id_1 :-1&1] = id_7;
    end
  wire id_12 = id_8;
  assign id_9[-1] = "";
  module_0 modCall_1 ();
  wire id_13;
  wire [1 'b0 : id_8] id_14;
endmodule
