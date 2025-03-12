// Seed: 1504849720
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_6 = id_3;
  wire  id_7;
  assign id_5 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_3
  );
  input wire id_1;
  assign id_3 = id_2[1];
endmodule
module module_2 #(
    parameter id_3 = 32'd69,
    parameter id_5 = 32'd7
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire id_4;
  output wire _id_3;
  input wire id_2;
  inout wire id_1;
  struct packed {
    logic [id_3 : id_5] id_8;
    logic [-1 : 1 'h0]  id_9;
  } [1 : -1] id_10;
  always @(posedge id_10.id_8) begin : LABEL_0
    $clog2(26);
    ;
  end
  module_0 modCall_1 (
      id_9,
      id_7,
      id_6,
      id_1,
      id_8
  );
endmodule
