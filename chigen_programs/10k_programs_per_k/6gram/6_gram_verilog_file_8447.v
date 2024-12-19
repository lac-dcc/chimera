// Seed: 3445126003
module module_0 #(
    parameter id_21 = 32'd5,
    parameter id_22 = 32'd46
) (
    input wire id_0,
    input wire id_1,
    input tri0 id_2,
    output wire id_3,
    input wire id_4,
    output tri0 id_5,
    output wor id_6,
    output tri0 id_7,
    input supply1 id_8,
    output wor id_9
    , id_16,
    input supply1 id_10,
    input wand id_11,
    input wor id_12,
    input supply0 id_13,
    output tri1 id_14
);
  wire id_17, id_18, id_19;
  assign id_7 = ({1{1}} - id_2);
  wire id_20;
  always @(1) #1;
  defparam id_21.id_22 = 1;
  assign module_1.type_24 = 0;
  id_23(
      .id_0(id_13 == 1), .id_1(1), .id_2(""), .id_3(1), .id_4(1)
  );
  assign id_6 = 1'b0;
endmodule
module module_1 (
    output tri1  id_0,
    input  wire  id_1,
    output wand  id_2,
    output tri0  id_3
    , id_18,
    input  wire  id_4,
    input  tri   id_5,
    input  tri0  id_6,
    input  tri   id_7,
    input  tri   id_8,
    output tri   id_9,
    input  wire  id_10,
    input  uwire id_11,
    input  wor   id_12,
    input  wor   id_13,
    input  tri   id_14,
    output uwire id_15,
    output tri0  id_16
);
  assign id_0 = id_18;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_18,
      id_2,
      id_13,
      id_3,
      id_18,
      id_18,
      id_11,
      id_18,
      id_5,
      id_4,
      id_14,
      id_12,
      id_0
  );
  wire id_19;
endmodule
