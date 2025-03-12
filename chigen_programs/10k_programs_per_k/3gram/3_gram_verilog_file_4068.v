// Seed: 1346403662
module module_0 (
    output uwire id_0,
    output wand id_1
    , id_10,
    input supply1 id_2,
    input uwire id_3,
    input wire id_4,
    input wand id_5,
    output tri id_6,
    input uwire id_7,
    input supply1 id_8
);
  assign id_10 = id_8;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd46
) (
    output tri0  id_0,
    input  tri   id_1,
    input  wire  _id_2,
    output logic id_3
);
  wire [1 : id_2  ||  1] id_5, id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1
  );
  assign id_6 = id_2;
  wire id_7;
  always @(posedge id_7) begin : LABEL_0
    #id_8;
  end
  always @(posedge -1'b0 or id_5) begin : LABEL_1
    id_3 = id_5;
  end
endmodule
