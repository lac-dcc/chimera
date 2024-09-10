// Seed: 3352034603
`timescale 1ps / 1ps
module module_0 #(
    parameter id_1  = 32'd5,
    parameter id_13 = 32'd25,
    parameter id_15 = 32'd84,
    parameter id_6  = 32'd27
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  input id_9;
  output id_8;
  output id_7;
  input _id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input _id_1;
  assign id_8[1] = id_4;
  logic id_10;
  assign id_3[1] = 1;
  reg id_11;
  assign id_6 = 1;
  assign id_8 = 1;
  always @(posedge id_4 ^ id_7 or posedge 1) begin
    id_2[id_1 : (1)] = 1;
    id_9 <= 1'b0;
    id_11[id_1+:1] = !id_3;
    id_6[1'b0] = 1;
    id_11 <= id_7;
    #1;
    id_5 = 1'b0;
    id_11 <= id_1;
  end
  assign id_8 = id_1;
  assign id_1[""] = id_4;
  logic id_12;
  assign id_6[1-id_6] = id_7[1];
  function _id_13;
    input id_14;
    int _id_15;
    begin
      if (1) begin
        id_8 = {1, id_6, id_12 << id_9} * id_1;
        SystemTFIdentifier;
      end else id_1 = id_8;
    end
  endfunction
  assign id_7 = 1;
  assign id_1 = 1 * 1 - 1 ? 1'b0 : 1;
  logic id_16;
  logic id_17;
  assign id_8[id_15] = id_6;
  assign id_8[id_13] = 1'b0;
  logic id_18 = id_14;
  logic id_19;
endmodule
