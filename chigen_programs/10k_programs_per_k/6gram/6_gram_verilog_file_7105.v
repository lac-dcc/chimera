// Seed: 1259021329
module module_0 (
    id_1,
    id_2,
    id_3
);
  output supply1 id_3;
  assign module_1.id_11 = 0;
  input wire id_2;
  input wire id_1;
  assign id_3#(
      .id_2(-1),
      .id_1(1)
  ) = 1'b0;
endmodule
module module_1 #(
    parameter id_1  = 32'd27,
    parameter id_11 = 32'd50,
    parameter id_12 = 32'd84,
    parameter id_14 = 32'd58
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11
);
  output wire _id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire _id_1;
  parameter id_12 = -1'b0;
  logic [id_1 : -1] id_13[-1 'h0 : id_11];
  ;
  localparam id_14 = -1;
  wire id_15;
  generate
    if (id_12) begin : LABEL_0
      defparam id_12.id_12 = id_12; defparam id_12.id_14 = id_12;
    end else begin : LABEL_1
      wire id_16;
      ;
      defparam id_12.id_14 = -1'b0; defparam id_12.id_12 = id_14 == -1;
      wire id_17;
      ;
    end
  endgenerate
  module_0 modCall_1 (
      id_10,
      id_5,
      id_8
  );
endmodule
