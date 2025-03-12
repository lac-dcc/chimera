// Seed: 3638664057
module module_0 #(
    parameter id_2  = 32'd0,
    parameter id_27 = 32'd22
) (
    id_1,
    _id_2,
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
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    _id_27
);
  input wire _id_27;
  inout wire id_26;
  inout wire id_25;
  inout wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  input wire id_19;
  output wire id_18;
  output uwire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire _id_2;
  output wire id_1;
  assign id_17 = 1;
  wire [id_2 : ~  id_27] id_28;
  wire id_29;
endmodule
module module_1 #(
    parameter id_10 = 32'd92,
    parameter id_11 = 32'd47,
    parameter id_2  = 32'd29,
    parameter id_3  = 32'd49,
    parameter id_4  = 32'd35,
    parameter id_6  = 32'd22
) (
    input supply1 id_0,
    input tri1 id_1,
    output supply1 _id_2,
    input wor _id_3,
    input supply1 _id_4
);
  wire [-1 : id_4] _id_6;
  assign id_6 = id_1;
  logic id_7;
  wire  id_8;
  localparam id_9 = 1;
  logic _id_10;
  ;
  integer [id_2  &  id_6  &  -1  <  1 'b0 : ""] _id_11;
  wire [1  &&  1 : 1] id_12;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_8,
      id_12,
      id_8,
      id_12,
      id_8,
      id_7,
      id_12,
      id_8,
      id_12,
      id_12,
      id_7,
      id_12,
      id_12,
      id_8,
      id_12,
      id_8,
      id_12,
      id_8,
      id_8,
      id_8,
      id_12,
      id_7,
      id_12,
      id_12,
      id_6
  );
  initial begin : LABEL_0
    if (id_9[id_3-1!==(id_10)]) begin : LABEL_1
      $clog2(id_6);
      ;
    end
  end
  wire [-1 'd0 : id_2] id_13;
  wire id_14;
  id_15 :
  assert property (@(posedge -1) -1)
  else $signed(id_6);
  ;
endmodule
