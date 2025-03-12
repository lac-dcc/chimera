// Seed: 2651402860
module module_0 #(
    parameter id_14 = 32'd14,
    parameter id_20 = 32'd76
);
  reg   id_1;
  reg   id_2;
  logic id_3;
  final id_2 = 1;
  struct packed {id_4 id_5;} id_6;
  always_ff id_1 <= id_6.id_5;
  parameter id_7 = "";
  assign id_3 = id_6.id_5[-1];
  assign id_6.id_4 = -1;
  wire id_8, id_9;
  parameter id_10 = -1;
  reg id_11;
  struct packed {logic id_12;} id_13;
  ;
  wire  _id_14 = 1, id_15;
  logic id_16 = id_3[1];
  logic id_17;
  always id_11 <= -1;
  logic [-1 : 1  ?  (  -1  ) : id_14] id_18;
  ;
  assign id_6.id_4 = 1;
  assign id_16 = id_9;
  logic id_19 = id_10, _id_20;
  logic id_21;
  always_comb begin : LABEL_0
    $clog2(23);
    ;
    logic [7:0][id_20] id_22;
  end
  always
    if ((1 & 1) || -1'b0) begin : LABEL_1
      id_13.id_12 = 1;
    end
  localparam id_23 = -1 == id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_20 = 0;
  output wire id_1;
  assign id_6 = id_5;
  wire id_7, id_8;
endmodule
