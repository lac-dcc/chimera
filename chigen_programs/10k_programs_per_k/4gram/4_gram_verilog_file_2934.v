// Seed: 269961107
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
    id_21,
    id_22
);
  input wire id_22;
  inout wire id_21;
  inout wire id_20;
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout supply0 id_1;
  wire id_23 = id_20;
  assign id_1 = -1;
  assign id_6[1] = id_21 ? 'd0 !== 1 : -1'b0;
endmodule
module module_0 #(
    parameter id_12 = 32'd26,
    parameter id_3  = 32'd86,
    parameter id_7  = 32'd94,
    parameter id_9  = 32'd39
) (
    module_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  inout wire id_11;
  output wire id_10;
  input wire _id_9;
  input wire id_8;
  input wire _id_7;
  input wire id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  output wire _id_3;
  output wire id_2;
  output wire id_1;
  wire _id_12[id_7  ==  1 : id_3  &&  -1];
  ;
  wire id_13;
  function reg [id_12 : -1] id_14;
    input [-1 : id_7] id_15;
    id_14 = id_4[1'h0==id_9];
  endfunction
  assign id_4 = id_5;
  wire  id_16;
  logic id_17;
  parameter id_18 = 1;
  assign id_13 = id_11;
  wire id_19;
  localparam id_20 = id_18;
  parameter id_21 = 1;
  module_0 modCall_1 (
      id_19,
      id_13,
      id_17,
      id_5,
      id_21,
      id_4,
      id_18,
      id_18,
      id_20,
      id_19,
      id_13,
      id_19,
      id_20,
      id_18,
      id_16,
      id_20,
      id_16,
      id_11,
      id_18,
      id_11,
      id_18,
      id_17
  );
  wire id_22;
  assign id_22 = id_8 == id_18 & id_8 * 1 - -1;
  initial begin
    id_14(id_6);
  end
endmodule
