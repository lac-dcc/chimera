// Seed: 71918591
module module_0 #(
    parameter id_5 = 32'd29
) (
    output wire id_0,
    output wire id_1
    , id_4, _id_5,
    output tri0 id_2
);
  wire [-1 : -1  ==  id_5] id_6;
  wire id_7;
  logic id_8;
  wire [1 : 1] id_9;
  logic id_10 = 1;
  wire id_11;
  assign id_2 = -1;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wor id_5,
    output wire id_6,
    input wand id_7,
    input supply1 id_8,
    output logic id_9,
    input tri id_10,
    input wor id_11,
    input tri1 id_12,
    output tri id_13
);
  always @(id_8 or posedge id_12) begin : LABEL_0
    id_9 <= 1;
  end
  xnor primCall (id_6, id_12, id_5, id_0, id_11, id_3, id_10, id_7, id_8);
  module_0 modCall_1 (
      id_6,
      id_4,
      id_6
  );
endmodule
