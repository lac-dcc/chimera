// Seed: 2409048400
program module_0 #(
    parameter id_4 = 32'd40,
    parameter id_7 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire _id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire [id_4 : 1] _id_7;
  tri id_8;
  wire id_9;
  ;
  assign id_8 = -1'h0;
  wand [id_7 : &  1] id_10;
  assign id_1  = id_3;
  assign id_10 = 1;
endprogram
module module_1 #(
    parameter id_11 = 32'd81,
    parameter id_4  = 32'd92,
    parameter id_9  = 32'd29
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9
);
  input wire _id_9;
  input wire id_8;
  inout wand id_7;
  input wire id_6;
  inout wire id_5;
  inout wire _id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_10;
  ;
  wire _id_11 = id_5;
  assign id_4 = id_8;
  initial begin : LABEL_0
    `define pp_12 0
  end
  tri id_13 = 1 * 1;
  assign id_7 = -1'b0;
  module_0 modCall_1 (
      id_13,
      id_5,
      id_10,
      id_4,
      id_8,
      id_5
  );
  struct packed {
    logic [id_4 : -1] id_14;
    logic [!  id_9 : id_11] id_15;
  } [-1  ==  id_9 : 1] id_16;
  ;
  logic [1 : 1] id_17;
  logic id_18;
  ;
endmodule
