// Seed: 701572361
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
    id_14
);
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_15;
  logic [-1 'b0 : -1  -  1 'd0] id_16;
endmodule
module module_1 #(
    parameter id_10 = 32'd52,
    parameter id_17 = 32'd53,
    parameter id_19 = 32'd71,
    parameter id_2  = 32'd40,
    parameter id_6  = 32'd57,
    parameter id_7  = 32'd84
) (
    input tri id_0,
    input supply1 id_1,
    output tri _id_2,
    input wire id_3,
    input supply1 id_4,
    input tri0 id_5,
    input wire _id_6,
    input wand _id_7,
    output logic id_8,
    input supply0 id_9,
    input wire _id_10,
    output wire id_11,
    output wor id_12
);
  logic [1 : id_2] id_14 = 1'b0;
  wire [id_6 : 1] id_15;
  wire id_16;
  wire _id_17;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16,
      id_14,
      id_14,
      id_16,
      id_16,
      id_15,
      id_15,
      id_14,
      id_14,
      id_16,
      id_15,
      id_15
  );
  assign id_16 = id_15;
  assign id_11 = -1;
  wire [-1 : -1 'h0] id_18;
  assign id_17 = id_14;
  parameter [1  -  1 : 1 'b0] id_19 = 1'b0;
  initial
    @(posedge -1 or posedge id_1 != -1) begin : LABEL_0
      id_8 = 1'd0;
    end
  reg [id_17 : -1] id_20;
  defparam id_19.id_19 = -1 - 1 ? id_19 : -1'b0;
  always id_20 <= 1;
  wire id_21;
  logic [(  (  id_7  )  ) : id_10] id_22;
endmodule
