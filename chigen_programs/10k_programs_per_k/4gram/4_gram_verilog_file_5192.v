// Seed: 143212385
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
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  localparam id_16 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_2,
      id_1,
      id_4,
      id_5,
      id_5,
      id_3,
      id_2,
      id_5,
      id_2,
      id_2,
      id_4,
      id_4
  );
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout supply1 id_2;
  input wire id_1;
  if (-1'd0) begin : LABEL_0
    tri id_7 = 1'b0;
  end else begin : LABEL_1
    assign id_2 = {1, id_3, id_3};
  end
endmodule
