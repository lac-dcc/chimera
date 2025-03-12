// Seed: 3608802848
module module_0 (
    id_1
);
  input wire id_1;
endmodule
module module_1 #(
    parameter id_12 = 32'd10
) (
    id_1,
    id_2,
    id_3#(
        .id_4(id_5),
        .id_6(1'b0),
        .id_7(1 - -1)
    ),
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (id_11);
  wire _id_12;
  ;
  wire [id_12  ?  1 'b0 : 1  ?  -1 'h0 : 1 : 1] id_13;
  integer id_14, id_15;
  assign id_2 = id_13;
  logic id_16;
  always @(posedge -1)
    if (1) begin : LABEL_0
      id_16 <= id_8[-1] != id_9;
    end else begin : LABEL_1
      id_16 = 1;
    end
endmodule
