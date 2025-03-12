// Seed: 3031453664
module module_0 (
    module_0,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_3;
  wire id_5 = id_3;
endmodule
module module_1 #(
    parameter id_1  = 32'd82,
    parameter id_13 = 32'd42,
    parameter id_2  = 32'd64,
    parameter id_3  = 32'd97,
    parameter id_4  = 32'd7
) (
    _id_1,
    _id_2,
    _id_3,
    _id_4
);
  inout wire _id_4;
  inout wire _id_3;
  inout wire _id_2;
  input wire _id_1;
  struct packed {
    struct packed {
      logic [-1 : id_1]   id_5;
      logic [id_1 : id_2] id_6;
    } [1 : id_2] id_7;
    logic [id_2 : id_1] id_8;
    logic [1 : id_1] id_9;
    logic [id_4 : id_3] id_10;
    logic [-1 : id_4] id_11;
  } id_12;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_7,
      id_10
  );
  wire _id_13, id_14, id_15, id_16;
  initial begin : LABEL_0
    id_12.id_11 = (id_12.id_5[""]);
    id_12.id_9  = 1;
  end
  for (id_17 = id_12.id_6[-1'h0 :-1]; 1 - 1'b0 | id_15; id_12.id_11 = 1'b0) begin : LABEL_1
    logic id_18;
  end
  logic [-1 : id_13] id_19;
  assign #((id_12.id_7)) id_13 = id_3;
  wire  id_20;
  logic id_21 = id_12.id_11;
endmodule
