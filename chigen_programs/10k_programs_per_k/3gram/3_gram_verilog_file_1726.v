// Seed: 2125612401
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input supply1 id_2,
    input wire id_3,
    input supply0 id_4,
    output uwire id_5,
    input uwire id_6,
    input tri0 id_7,
    input wand id_8,
    input supply0 id_9,
    input wand id_10,
    output supply0 id_11
    , id_25,
    output tri0 id_12,
    input uwire id_13,
    input tri0 id_14,
    output wire id_15,
    output tri1 id_16,
    input uwire id_17,
    output wire id_18,
    input tri1 id_19,
    input uwire id_20,
    output wand id_21,
    input supply1 id_22,
    output tri0 id_23
);
endmodule
module module_1 #(
    parameter id_0 = 32'd33,
    parameter id_4 = 32'd97
) (
    input supply1 _id_0,
    output supply1 id_1,
    output wire id_2,
    output wor id_3,
    input supply1 _id_4,
    input wire id_5,
    input wire id_6
);
  wire id_8;
  integer id_9;
  wire id_10;
  tri id_11;
  assign id_11 = id_5;
  wire id_12;
  wire [id_4 : id_0] id_13;
  or primCall (id_2, id_6, id_9, id_12, id_11, id_10, id_5);
  module_0 modCall_1 (
      id_6,
      id_3,
      id_6,
      id_6,
      id_6,
      id_1,
      id_5,
      id_5,
      id_5,
      id_5,
      id_6,
      id_3,
      id_2,
      id_5,
      id_6,
      id_2,
      id_3,
      id_6,
      id_2,
      id_6,
      id_6,
      id_3,
      id_5,
      id_2
  );
  assign id_11 = -1;
  wire id_14;
  reg id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22;
  assign id_21 = id_9 / 1'b0;
  wire id_23;
  parameter id_24 = 1;
  logic [-1 : ""] id_25 = id_4;
  always @(posedge id_12 or id_25) begin : LABEL_0
    id_19 <= -1'b0;
  end
endmodule
