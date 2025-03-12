// Seed: 196987288
module module_0 #(
    parameter id_1 = 32'd1
);
  wire _id_1;
  integer id_2 = id_1;
  logic id_3;
  ;
  wand id_4 = -1;
  bit  id_5;
  always_latch id_5 <= {{-1{id_5}}};
  logic id_6;
endmodule
module module_1 #(
    parameter id_1  = 32'd57,
    parameter id_10 = 32'd14,
    parameter id_2  = 32'd68,
    parameter id_9  = 32'd5
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7[id_2 : id_10],
    id_8,
    _id_9,
    _id_10
);
  inout wire _id_10;
  input wire _id_9;
  inout supply1 id_8;
  output logic [7:0] id_7;
  output wire id_6;
  module_0 modCall_1 ();
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire _id_2;
  output wire _id_1;
  assign id_8 = 1'h0;
  logic id_11, id_12;
  struct packed {
    enum {
      id_13[1] = -1,
      id_14 = id_12,
      id_15 = 1
    } id_16[1 : 1];
    logic id_17;
  }
      id_18, id_19;
  assign id_11 = id_18.id_16;
  wire [{  -1  ,  1 'b0 ,  -1 'h0 ,  1  ,  id_2  } : id_9] id_20[1 : id_1], id_21, id_22, id_23;
  assign id_19 = id_18.id_13;
  wire id_24;
endmodule
