// Seed: 1252406296
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  wire id_6;
  localparam id_7 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_5
  );
  integer id_6 = id_1;
endmodule
module module_2 #(
    parameter id_11 = 32'd7,
    parameter id_2  = 32'd58,
    parameter id_3  = 32'd53,
    parameter id_5  = 32'd79
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    _id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  input wire id_17;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_16
  );
  inout wire id_16;
  inout logic [7:0] id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  nor primCall (id_7, id_14, id_17, id_18, id_1, id_16, id_8, id_15, id_4, id_6, id_12);
  input wire _id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire id_4;
  inout wire _id_3;
  input wire _id_2;
  input wire id_1;
  logic [id_11 : id_5] id_19 = 1;
  assign id_3 = id_17;
  assign id_15[-1] = !-1'b0;
  genvar id_20;
  wire [{  1  ==  -1  {  id_3  }  }  *  id_2 : id_5] id_21;
endmodule
