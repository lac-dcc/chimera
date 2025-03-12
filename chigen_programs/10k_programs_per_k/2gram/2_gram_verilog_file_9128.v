// Seed: 3623374249
module module_0 (
    output wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input tri id_3,
    output tri1 id_4,
    input tri id_5,
    input supply1 id_6,
    output tri id_7
    , id_10,
    input tri0 id_8
);
  wire id_11;
  assign id_11 = id_3;
endmodule
module module_1 #(
    parameter id_10 = 32'd96
) (
    input  wand  id_0,
    input  wire  id_1,
    output uwire id_2,
    input  uwire id_3,
    output logic id_4,
    output tri0  id_5,
    input  wor   id_6
    , id_9,
    output wand  id_7
    , _id_10
);
  wire ["" : id_10] id_11;
  wire id_12;
  assign id_12 = ((id_3));
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_6,
      id_7,
      id_1,
      id_3,
      id_7,
      id_0
  );
  assign modCall_1.id_8 = 0;
  always begin : LABEL_0
    begin : LABEL_1
      id_4 <= -1'b0;
    end
  end
endmodule
