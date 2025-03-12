// Seed: 1356222867
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout tri id_13;
  inout wire id_12;
  output wire id_11;
  assign module_1.id_3 = 0;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_22 = 1'b0;
  assign id_13 = 1;
endmodule
module module_1 #(
    parameter id_12 = 32'd70,
    parameter id_4  = 32'd68,
    parameter id_5  = 32'd8
) (
    input tri0 id_0,
    input tri1 id_1,
    input supply0 id_2,
    output tri0 id_3,
    input wor _id_4,
    input supply1 _id_5,
    input tri id_6,
    output tri0 id_7,
    output logic id_8,
    input wor id_9,
    input supply0 id_10,
    output tri0 id_11,
    input tri0 _id_12
);
  wire id_14;
  parameter [id_12 : 1] id_15 = -1'd0;
  wire [(  id_4  )  |  (  id_5  ~^  (  1  )  )  |  -1  |  1 : id_12] id_16;
  initial begin : LABEL_0
    id_8 <= id_10;
  end
  parameter id_17 = 1, id_18 = -1'h0;
  module_0 modCall_1 (
      id_15,
      id_17,
      id_16,
      id_15,
      id_17,
      id_17,
      id_17,
      id_16,
      id_18,
      id_14,
      id_15,
      id_17,
      id_18,
      id_14,
      id_17,
      id_16,
      id_17,
      id_18,
      id_16,
      id_15,
      id_14
  );
  wire id_19;
endmodule
