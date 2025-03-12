// Seed: 3649227036
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    output wire id_6,
    output wand id_7,
    input supply1 id_8,
    input tri id_9
);
  assign id_6 = id_1;
  wire id_11;
endmodule
module module_1 #(
    parameter id_10 = 32'd5,
    parameter id_11 = 32'd57,
    parameter id_12 = 32'd36
) (
    output tri0 id_0
    , _id_10,
    output wor id_1,
    output wor id_2,
    input tri id_3,
    input wor id_4,
    input supply1 id_5,
    input supply1 id_6,
    input uwire id_7,
    output wand id_8
);
  wire _id_11;
  wire _id_12;
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_5,
      id_3,
      id_0,
      id_1,
      id_3,
      id_4
  );
  assign modCall_1.id_1 = 0;
  reg [id_12  ==?  id_10 : id_11] id_13;
  logic id_14;
  always @(*) begin : LABEL_0
    id_14 <= -1'b0;
    id_13 = 1;
  end
  nor primCall (id_2, id_4, id_6, id_7, id_5, id_3);
endmodule
