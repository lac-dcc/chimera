// Seed: 2553442340
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
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output supply0 id_8;
  inout tri0 id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = 1;
  logic id_15 = id_5 == 1;
  assign id_7 = {1'b0, -1};
endmodule
module module_1 #(
    parameter id_3 = 32'd56,
    parameter id_5 = 32'd1
) (
    output wor id_0,
    input supply0 id_1,
    input wor id_2,
    input tri0 _id_3,
    input wire id_4,
    output supply0 _id_5,
    input supply1 id_6,
    input tri id_7,
    input supply1 id_8,
    input wor id_9,
    input tri id_10
    , id_14,
    output uwire id_11,
    input tri0 id_12
);
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14,
      id_14
  );
  logic [id_5 : 1] id_15;
  always @(1'b0 or -1, -1 or posedge -1) begin : LABEL_0
    assign id_0 = id_15[id_3];
    #1;
  end
endmodule
