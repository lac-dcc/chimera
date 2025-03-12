// Seed: 1168430826
module module_0 #(
    parameter id_1 = 32'd46,
    parameter id_6 = 32'd90
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire _id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire _id_1;
  logic [id_1 : id_6] id_11;
endmodule
module module_1 #(
    parameter id_9 = 32'd89
) (
    input tri0 id_0,
    input uwire id_1,
    output logic id_2,
    output logic id_3,
    output tri1 id_4,
    output uwire id_5,
    input tri id_6,
    input supply0 id_7
);
  parameter id_9 = 1;
  localparam id_10 = id_9;
  assign id_4 = -1;
  assign id_5 = 1;
  logic [-1 : 1] id_11;
  ;
  wire [id_9 : 1] id_12;
  always @(posedge id_9 or posedge id_7) begin : LABEL_0
    id_3 <= id_1;
    id_2 <= -1;
    assert (id_7);
  end
  wire id_13;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_13,
      id_12,
      id_11,
      id_9,
      id_10,
      id_12,
      id_10,
      id_11
  );
endmodule
