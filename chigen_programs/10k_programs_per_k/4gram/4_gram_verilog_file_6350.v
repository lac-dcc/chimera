// Seed: 1023484291
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
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_9 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd5,
    parameter id_8 = 32'd4
) (
    input  tri1  id_0
    , id_6,
    output logic id_1,
    output logic id_2,
    input  tri1  _id_3
    , id_7,
    input  tri0  id_4
);
  wire _id_8;
  always @(posedge id_4 or posedge id_6) begin : LABEL_0
    id_6 = id_4;
    id_1 <= id_0 + id_3;
  end
  wire [1  +  -1  +  id_3  +  -1 : id_8] id_9;
  assign id_7 = -1;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_9
  );
  always @(posedge 1)
    case (id_0)
      default: id_2 <= id_6;
    endcase
  logic [-1 : id_3] id_10;
  ;
  wire id_11, id_12;
  wire id_13[1 : 1];
endmodule
