// Seed: 1606640777
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
    id_17
);
  output supply1 id_17;
  input wire id_16;
  assign module_1.id_9 = 0;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_18;
  ;
  assign id_17 = -1;
endmodule
module module_0 #(
    parameter id_16 = 32'd15
) (
    output wor id_0,
    input wor id_1,
    input tri1 id_2,
    input wand id_3,
    input supply0 sample,
    output wor id_5,
    input wire id_6,
    input wor id_7,
    input supply0 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wor id_12,
    input wand id_13,
    output wor id_14,
    input supply0 module_1,
    input wor _id_16,
    input wand id_17,
    input wand id_18,
    output tri0 id_19,
    input wand id_20,
    input tri1 id_21,
    output tri1 id_22,
    input wor id_23,
    input supply0 id_24,
    input supply0 id_25,
    output supply0 id_26,
    input wor id_27,
    input wire id_28,
    input tri1 id_29,
    output tri id_30,
    output supply1 id_31,
    input wire id_32
    , id_41,
    input uwire id_33,
    output wire id_34,
    output tri0 id_35,
    input tri0 id_36,
    input uwire id_37,
    output supply1 id_38,
    inout uwire id_39
);
  localparam id_42 = 1;
  always @(posedge -1'b0) begin : LABEL_0
    assume (id_29);
  end
  localparam id_43 = id_26++ ^ 1;
  module_0 modCall_1 (
      id_43,
      id_43,
      id_42,
      id_41,
      id_41,
      id_43,
      id_42,
      id_42,
      id_41,
      id_42,
      id_43,
      id_41,
      id_42,
      id_43,
      id_42,
      id_41,
      id_42
  );
  wand id_44 = 1;
  wire [-1 : id_16] id_45;
  nor primCall (
      id_5,
      id_7,
      id_32,
      id_13,
      id_6,
      id_8,
      id_39,
      id_20,
      id_29,
      id_11,
      id_23,
      id_28,
      id_17,
      id_24,
      id_37,
      id_10,
      id_33,
      id_42,
      id_27,
      id_3,
      id_1,
      id_25,
      id_2,
      id_41,
      id_12,
      id_18,
      id_21,
      id_43,
      id_36
  );
endmodule
