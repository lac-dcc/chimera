// Seed: 4182790171
module module_0 (
    input tri1 id_0,
    output supply0 id_1,
    output wire id_2,
    input tri1 id_3,
    input wire id_4,
    input wand id_5,
    input tri1 id_6,
    input tri0 id_7,
    input supply0 id_8,
    output uwire id_9,
    input wire id_10,
    input tri1 id_11
);
  reg id_13;
  ;
  reg id_14, id_15;
  final begin : LABEL_0
    id_13 <= -1'h0;
  end
  initial begin : LABEL_1
    id_13 <= id_4;
    id_14 = {id_3, -1};
  end
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input uwire id_2
);
  logic id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1
  );
endmodule
