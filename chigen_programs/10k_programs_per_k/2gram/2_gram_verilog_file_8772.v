// Seed: 361718000
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input tri id_2,
    output supply0 id_3,
    input uwire id_4,
    input uwire id_5,
    input wand id_6
    , id_11,
    input supply0 id_7,
    input supply0 id_8,
    input wand id_9
);
  logic id_12;
  wire [1 : -1] id_13;
  assign module_1.id_8 = 0;
  wire id_14;
  integer id_15 = id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd96
) (
    input tri1 _id_0,
    input supply1 id_1,
    input supply0 id_2,
    output wor id_3,
    input tri1 id_4,
    output logic id_5,
    output uwire id_6,
    output tri id_7,
    input supply1 id_8,
    input tri1 id_9,
    input uwire id_10
);
  wire [~  id_0 : 1 'b0 ==  ~  1 'b0] id_12;
  final begin : LABEL_0
    id_5 <= -1;
  end
  or primCall (id_6, id_8, id_1, id_2, id_4, id_10, id_9);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_10,
      id_7,
      id_9,
      id_10,
      id_8,
      id_8,
      id_1,
      id_8
  );
endmodule
