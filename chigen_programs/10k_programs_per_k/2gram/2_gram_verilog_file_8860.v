// Seed: 3099294781
module module_0 (
    input  wor   id_0,
    output tri1  id_1,
    input  uwire id_2,
    output tri0  id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  wire  id_6,
    input  wand  id_7,
    input  uwire id_8,
    output tri   id_9,
    output wand  id_10,
    input  wire  id_11
);
  wire [1 : 1] id_13;
  assign id_3 = id_11;
  wire id_14;
  wire id_15;
endmodule
module module_1 #(
    parameter id_4 = 32'd27,
    parameter id_6 = 32'd4,
    parameter id_7 = 32'd29
) (
    input tri1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output logic id_3,
    input tri _id_4,
    output tri0 id_5,
    input wand _id_6,
    input wor _id_7,
    input tri id_8,
    input wand id_9,
    output supply1 id_10
);
  wire [(  id_6  ) : id_4  ==  id_7] id_12;
  logic [-1 : id_6] id_13 = (id_0 / -1);
  always begin : LABEL_0
    id_3 = -1;
  end
  module_0 modCall_1 (
      id_1,
      id_10,
      id_1,
      id_5,
      id_9,
      id_0,
      id_1,
      id_1,
      id_1,
      id_5,
      id_5,
      id_0
  );
  localparam id_14 = 1;
endmodule
