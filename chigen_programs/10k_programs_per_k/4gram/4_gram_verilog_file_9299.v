// Seed: 1093286347
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  output logic [7:0] id_2;
  output wire id_1;
  assign id_2[-1] = id_3;
  assign id_2 = id_5;
  assign id_4[1 :-1] = id_5;
  integer id_7;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd81,
    parameter id_4 = 32'd75
) (
    id_1,
    _id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  inout wire id_3;
  input wire _id_2;
  inout wire id_1;
  tri1 id_5;
  assign id_5 = 1;
  if (1) begin : LABEL_0
    assign id_3 = id_4;
  end
  logic [7:0] id_6;
  wire [id_2 : id_4] id_7;
  parameter id_8 = 1;
  assign id_3 = id_6[id_2];
  module_0 modCall_1 (
      id_5,
      id_6,
      id_5,
      id_6,
      id_1,
      id_5
  );
  wire id_9;
  logic id_10 = id_1;
  wire [id_2  >>>  -1 : id_2  -  -1] id_11;
  always_ff @(id_8 or posedge id_7) begin : LABEL_1
    return ~id_6;
  end
  parameter id_12 = id_8 - id_8;
endmodule
