// Seed: 1920402942
module module_0 #(
    parameter id_1 = 32'd2
);
  wire _id_1;
  wire id_2;
  wire id_3;
  wire id_4;
  wire [id_1 : id_1] id_5;
endmodule
module module_1 #(
    parameter id_13 = 32'd25,
    parameter id_3  = 32'd90,
    parameter id_31 = 32'd36
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  input wire id_27;
  input wire id_26;
  output wire id_25;
  input wire id_24;
  output wire id_23;
  output wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire _id_13;
  inout wire id_12;
  and primCall (
      id_11, id_12, id_14, id_17, id_19, id_2, id_21, id_24, id_26, id_27, id_5, id_6, id_8, id_9
  );
  output logic [7:0] id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  module_0 modCall_1 ();
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire _id_3;
  inout wire id_2;
  input logic [7:0] id_1;
  localparam id_28 = 1, id_29 = 1, id_30 = id_9 - id_27;
  static logic [1 : id_3] _id_31;
  ;
  assign id_8  = id_5;
  assign id_20 = -1;
  id_32 :
  assert property (@(posedge id_10) 1)
  else $clog2(id_29);
  ;
  assign id_11[id_31] = -1 === id_19;
  assign id_12#(
      .id_32(id_30),
      .id_5 (id_29),
      .id_19(-1),
      .id_12(id_29),
      .id_6 (-1'h0 ? 1 : id_30),
      .id_14(id_29),
      .id_26(1'b0),
      .id_32(1)
  ) = id_2;
endmodule
