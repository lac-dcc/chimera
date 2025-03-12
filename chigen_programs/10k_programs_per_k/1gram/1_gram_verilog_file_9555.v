// Seed: 3021736516
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire [1 : -1] id_9;
endmodule
module module_1 #(
    parameter id_0 = 32'd38,
    parameter id_4 = 32'd71,
    parameter id_5 = 32'd49,
    parameter id_7 = 32'd89
) (
    input  wand  _id_0,
    output logic id_1
);
  wire id_3;
  ;
  logic _id_4;
  logic [7:0] _id_5, id_6[id_4 : id_5];
  assign id_4 = id_6[1==id_4];
  logic [7:0][id_0] _id_7;
  always id_1 <= id_6[-1'b0 : {"", 1^id_7, 1'b0}];
  parameter id_8 = -1;
  wire id_9;
  ;
  wire id_10[id_5 : 1];
  assign id_4 = id_8;
  supply1 id_11 = 1'h0;
  id_12 :
  assert property (@(negedge id_0) id_6) begin : LABEL_0
    id_12 <= "";
  end
  localparam id_13 = 1;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_3,
      id_9,
      id_3,
      id_8,
      id_10,
      id_10
  );
endmodule
