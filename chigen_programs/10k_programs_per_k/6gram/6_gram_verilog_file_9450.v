// Seed: 2118652370
module module_0 #(
    parameter id_7 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [-1 : -1] _id_7 = id_4;
  logic [7:0] id_8;
  assign id_8[1'b0] = "";
  logic [id_7  ==  1 'd0 : -1] id_9;
endmodule
module module_1 #(
    parameter id_20 = 32'd20,
    parameter id_24 = 32'd9,
    parameter id_4  = 32'd63,
    parameter id_8  = 32'd0
) (
    input uwire id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri1 _id_4,
    output supply1 id_5,
    input wor id_6,
    input tri id_7,
    input supply1 _id_8,
    input wor id_9,
    input wor id_10,
    output logic id_11,
    output logic id_12,
    input wire id_13,
    input tri0 id_14,
    input supply0 id_15,
    input wor id_16,
    input supply0 id_17,
    input supply0 id_18,
    input wor id_19,
    input supply0 _id_20,
    output supply0 id_21
);
  logic [id_20  ==  1 : id_8] id_23 = id_19, _id_24;
  wire [-1 : id_4  -  id_24] id_25;
  module_0 modCall_1 (
      id_23,
      id_25,
      id_25,
      id_25,
      id_23,
      id_23
  );
  always @(posedge id_8, posedge id_6) begin : LABEL_0
    if (1) begin : LABEL_1
      id_11 <= id_9;
      id_11 = id_9;
      fork
        #id_26 id_12 = 1 - -1;
      join
    end
  end
endmodule
