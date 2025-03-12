// Seed: 1532246682
module module_0 (
    id_1,
    id_2
);
  inout tri1 id_2;
  input wire id_1;
  assign id_2 = -1;
  logic id_3;
  assign id_3[-1] = id_1;
  supply0 id_4, id_5, id_6, id_7, id_8;
  assign id_4 = -1'b0;
  integer id_9;
  ;
  assign id_4 = -1;
endmodule
module module_1 #(
    parameter id_3 = 32'd17,
    parameter id_5 = 32'd17
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5
);
  input wire _id_5;
  output wire id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  real id_6;
  localparam id_7 = 1'h0;
  localparam id_8 = id_7;
  parameter id_9 = 1;
  logic [7:0] id_10;
  ;
  logic id_11 = id_3;
  assign id_10[1 :-1] = id_11;
  module_0 modCall_1 (
      id_1,
      id_9
  );
  assign modCall_1.id_2 = 0;
  always @(posedge id_7 == id_3) begin : LABEL_0
    id_2[id_3 : id_5] = 1;
  end
endmodule
