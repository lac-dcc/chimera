// Seed: 86746497
module module_0 (
    output wor   id_0,
    input  uwire id_1,
    input  tri1  id_2,
    input  wand  id_3,
    output wire  id_4
);
  wire id_6;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd94
) (
    input  wor   id_0,
    output tri   id_1,
    input  uwire _id_2,
    input  tri   id_3,
    output uwire id_4,
    output tri0  id_5
);
  wire [id_2  ==  id_2 : {  id_2  {  -1  }  }] id_7;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 (
    output logic id_0,
    input uwire id_1,
    input tri0 id_2,
    input wand id_3,
    input tri id_4,
    output wor id_5,
    output tri id_6,
    output wire id_7,
    input supply1 id_8,
    output tri id_9
    , id_11
);
  always @(posedge id_4 or posedge id_3) begin : LABEL_0
    id_0 <= id_3 ? id_1 !== -1 : 1'b0 != -1;
  end
  module_0 modCall_1 (
      id_9,
      id_3,
      id_1,
      id_2,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
