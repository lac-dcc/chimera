// Seed: 2917405167
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    input wire id_2,
    output tri0 id_3,
    input wand id_4,
    input tri0 id_5,
    output wand id_6,
    output uwire id_7,
    input wire id_8,
    input wand id_9,
    input tri0 id_10,
    input wor id_11,
    input wand id_12,
    input uwire id_13
);
  always begin : LABEL_0
    assume #1  ({id_8, id_13}) $unsigned(9);
    ;
    SystemTFIdentifier(1, 1'b0, -1, 1, -1);
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd56,
    parameter id_1 = 32'd79,
    parameter id_6 = 32'd18,
    parameter id_7 = 32'd87,
    parameter id_9 = 32'd12
) (
    input tri1 _id_0,
    input supply1 _id_1,
    output tri id_2,
    input tri1 id_3
    , _id_6,
    output supply0 id_4
);
  assign id_4 = id_6;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
  wire [-1 : id_1] _id_7;
  wire \id_8 ;
  wire _id_9;
  ;
  wire [id_0 : id_6  -  id_7] id_10;
  generate
    for (id_11 = 1; -1; id_11 = id_7) begin : LABEL_0
      logic [id_9 : -1] id_12;
    end
  endgenerate
endmodule
