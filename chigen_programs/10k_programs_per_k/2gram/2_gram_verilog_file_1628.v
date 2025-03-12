// Seed: 3237921569
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
    id_19
);
  inout wire id_19;
  inout wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_12 = id_2;
endmodule
module module_1 #(
    parameter id_0  = 32'd92,
    parameter id_16 = 32'd52,
    parameter id_2  = 32'd56,
    parameter id_3  = 32'd1,
    parameter id_5  = 32'd80
) (
    input wire _id_0,
    output wor id_1,
    input wor _id_2,
    input tri0 _id_3,
    output tri1 id_4,
    input tri0 _id_5,
    input wire id_6,
    input supply0 id_7,
    output tri1 id_8,
    input wand id_9,
    input supply1 id_10,
    input supply0 id_11,
    input supply0 id_12,
    input supply1 id_13,
    input tri id_14,
    output supply1 id_15,
    input wor _id_16,
    input tri id_17,
    inout uwire id_18
);
  logic [-1 : id_16] id_20;
  assign id_1 = (id_3);
  logic [7:0][-1 : id_2]
      id_21, id_22, id_23, id_24, id_25, \id_26 , id_27, id_28, id_29, id_30, id_31;
  always begin : LABEL_0
    foreach (id_32[1]) begin : LABEL_1
      `define pp_33 0
      id_29[(id_2)-:id_5] = id_21;
    end
  end
  wire [id_3 : id_0] id_34;
  module_0 modCall_1 (
      id_20,
      id_34,
      id_34,
      id_20,
      id_20,
      id_34,
      id_20,
      id_34,
      id_20,
      id_20,
      id_20,
      id_34,
      id_34,
      id_20,
      id_34,
      id_34,
      id_20,
      id_20,
      id_34
  );
  wire id_35;
endmodule
