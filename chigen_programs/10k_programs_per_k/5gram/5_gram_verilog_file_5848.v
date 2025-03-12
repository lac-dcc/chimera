// Seed: 760587048
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd26,
    parameter id_4  = 32'd80,
    parameter id_6  = 32'd2
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  output wire id_18;
  inout logic [7:0] id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire _id_13;
  output logic [7:0] id_12;
  inout wire id_11;
  module_0 modCall_1 (
      id_14,
      id_14,
      id_14
  );
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire _id_6;
  input wire id_5;
  inout wire _id_4;
  input wire id_3;
  output wire id_2;
  output reg id_1;
  always @(id_11 or posedge id_17[id_4 : 1'b0]) begin : LABEL_0
    id_1 = (id_6 || -1'b0);
    id_12[id_6 : 1] <= id_6;
  end
  wire [{  ~  id_13  {  1  }  } : id_4  >  -1 'b0 -  1] id_19;
endmodule
