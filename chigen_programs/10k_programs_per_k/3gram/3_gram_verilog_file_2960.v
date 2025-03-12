// Seed: 66309856
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output tri id_3,
    input tri0 id_4,
    input tri id_5,
    input supply1 id_6,
    output uwire id_7,
    input wor id_8,
    input wand id_9,
    output tri1 id_10,
    output tri0 id_11,
    input wor id_12
    , id_33,
    output uwire id_13,
    input wand id_14,
    output tri1 id_15,
    output wire id_16
    , id_34,
    input supply0 id_17,
    output tri0 id_18,
    output wor id_19,
    input tri1 id_20,
    output tri0 id_21,
    input wire id_22,
    output tri0 id_23,
    input wire id_24,
    output wor id_25,
    input wire id_26,
    input tri1 id_27,
    input supply0 id_28,
    input wand id_29,
    output wand id_30,
    output supply1 id_31
);
endmodule
module module_1 #(
    parameter id_12 = 32'd32
) (
    input uwire id_0,
    input uwire id_1,
    input wand id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input tri id_6,
    input tri1 id_7,
    input wand id_8,
    output wand id_9,
    output supply1 id_10,
    input tri0 id_11,
    input tri1 _id_12,
    input wor id_13,
    output tri id_14
    , id_18,
    input uwire id_15,
    input tri0 id_16
);
  assign id_18 = id_15;
  logic id_19;
  assign id_5 = id_3;
  logic id_20;
  wire  id_21;
  wire  id_22;
  ;
  assign id_5 = id_11;
  wire id_23;
  wire id_24 [-1 : id_12];
  assign id_18 = 1;
  wire id_25;
  wire id_26;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_0,
      id_2,
      id_0,
      id_9,
      id_4,
      id_8,
      id_5,
      id_5,
      id_4,
      id_5,
      id_15,
      id_10,
      id_14,
      id_3,
      id_9,
      id_5,
      id_11,
      id_10,
      id_15,
      id_14,
      id_15,
      id_14,
      id_3,
      id_7,
      id_16,
      id_15,
      id_10,
      id_14
  );
  wire id_27 = id_2;
  wire id_28;
  always @(-1 == id_11) begin : LABEL_0
    id_18 <= #1 id_25 - id_6;
  end
endmodule
