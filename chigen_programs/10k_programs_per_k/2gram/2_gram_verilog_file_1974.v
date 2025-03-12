// Seed: 2540404735
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout supply1 id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout tri0 id_1;
  wire id_14;
  assign id_13 = -1;
  localparam id_15 = 1, id_16 = -1;
  assign id_1 = -1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_4 = 32'd36,
    parameter id_5 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [-1 : -1] _id_5;
  reg id_6;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign id_3 = id_5;
  struct packed {
    logic id_7;
    id_8  id_9;
    logic id_10;
  } id_11;
  ;
  always
    if (1'b0) begin : LABEL_0
      id_11.id_7 <= id_11.id_7;
    end
  always_comb begin : LABEL_1
    id_6 <= 1;
  end
  assign id_11[-1+id_5-id_4 : 1] = "";
  wire id_12;
  assign id_11.id_8[-1||1 : id_4] = -1'b0;
  assign id_2 = 1;
  assign id_11.id_7 = 1'b0 || id_12;
endmodule
