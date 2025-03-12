// Seed: 1517096365
module module_0;
  wire id_1;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd93
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  output tri1 id_5;
  output wire id_4;
  input logic [7:0] id_3;
  input wire _id_2;
  input wire id_1;
  assign id_5 = id_3[id_2] && -1;
  module_0 modCall_1 ();
endmodule
module module_0 #(
    parameter id_1  = 32'd19,
    parameter id_14 = 32'd84,
    parameter id_3  = 32'd37,
    parameter id_6  = 32'd98
) (
    output tri0  id_0
    , id_12,
    input  tri0  module_2,
    output tri0  id_2,
    input  tri   _id_3,
    input  tri   id_4,
    input  uwire id_5,
    input  tri1  _id_6,
    output logic id_7,
    input  uwire id_8,
    output logic id_9,
    output logic id_10
);
  logic [7:0] id_13;
  assign id_0 = id_6 * 1'd0;
  wire [id_1  -  id_6 : id_3] _id_14;
  localparam id_15 = 1 == -1'h0;
  always @(1 or posedge id_5) begin : LABEL_0
    if (1)
      if (1) begin : LABEL_1
        id_10 <= (id_8) == id_13[-1 :-1'b0];
        id_9  <= ~id_6;
      end
    if (-1 ^ 1) begin : LABEL_2
      id_7 <= -1;
    end else begin : LABEL_3
      assert (-1);
    end
  end
  assign id_12[1] = id_7++ + id_12[id_14];
  module_0 modCall_1 ();
  logic id_16;
endmodule
