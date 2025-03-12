// Seed: 3991346986
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
    id_22,
    id_23
);
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic id_24;
  wire  id_25;
  id_26 :
  assert property (@(1 or posedge id_25) 1)
  else;
endmodule
module module_1 #(
    parameter id_1  = 32'd69,
    parameter id_16 = 32'd61,
    parameter id_21 = 32'd34,
    parameter id_5  = 32'd33,
    parameter id_7  = 32'd36
) (
    output wor id_0,
    input supply0 _id_1,
    input wor id_2,
    input tri0 id_3
    , id_31,
    output wor id_4,
    output uwire _id_5,
    input supply0 id_6,
    input tri0 _id_7,
    output logic id_8,
    output tri id_9,
    input tri0 id_10,
    input tri id_11
    , id_32,
    input uwire id_12,
    output tri0 id_13,
    output wor id_14
    , id_33,
    input supply0 id_15,
    input tri1 _id_16,
    output supply0 id_17,
    output uwire id_18,
    output supply0 id_19,
    input tri1 id_20,
    input supply0 _id_21,
    output wor id_22,
    input tri0 id_23,
    output tri0 id_24,
    output uwire id_25,
    output supply1 id_26,
    input tri id_27,
    input wand id_28,
    input wor id_29
);
  struct packed {
    logic id_34;
    logic [id_16 : -1] id_35;
    logic id_36;
    logic id_37;
  } [id_7 : -1  -  id_5] id_38;
  always_ff begin : LABEL_0
    id_8 <= 1'b0;
  end
  wire id_39;
  module_0 modCall_1 (
      id_36,
      id_33,
      id_31,
      id_36,
      id_35,
      id_33,
      id_35,
      id_33,
      id_36,
      id_37,
      id_34,
      id_34,
      id_36,
      id_32,
      id_32,
      id_39,
      id_32,
      id_35,
      id_34,
      id_32,
      id_34,
      id_33,
      id_33
  );
  assign id_38.id_34 = id_38.id_37[id_1];
  logic [(  1  ) : (  -1  -  id_21  )] id_40, id_41;
endmodule
