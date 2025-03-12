// Seed: 1252698923
module module_0 (
    output wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    output wand id_3,
    output tri id_4,
    input tri id_5,
    output wand id_6,
    input tri0 id_7,
    input uwire id_8,
    input wire id_9,
    input wor id_10,
    input wand id_11,
    input supply0 id_12,
    input supply0 id_13
);
  assign id_4 = 1 - id_12;
  logic id_15 = id_9;
  wire  id_16;
  assign module_1.id_10 = 0;
  wire id_17;
  assign id_15 = id_9;
  logic id_18;
  wire  id_19;
endmodule
module module_0 #(
    parameter id_1 = 32'd29,
    parameter id_3 = 32'd56,
    parameter id_5 = 32'd28
) (
    output wire id_0
    , id_13,
    input tri0 _id_1,
    output wand id_2,
    input wor _id_3,
    input tri1 id_4,
    input supply0 _id_5,
    output wand id_6,
    output tri0 id_7,
    output wor id_8,
    output wire id_9,
    output uwire id_10,
    input wire id_11
);
  wire [{  -1  ,  1  ,  id_3  &&  id_3  ==?  -1  ,  id_1  } : id_5] id_14;
  always @(posedge id_3) begin : LABEL_0
    assume (module_1);
  end
  module_0 modCall_1 (
      id_0,
      id_4,
      id_10,
      id_9,
      id_7,
      id_11,
      id_8,
      id_11,
      id_11,
      id_11,
      id_11,
      id_4,
      id_4,
      id_11
  );
endmodule
