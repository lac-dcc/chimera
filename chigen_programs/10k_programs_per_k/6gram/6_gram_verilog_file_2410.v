// Seed: 2103343410
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    input  wire  id_2,
    output wand  id_3,
    input  tri0  id_4,
    output logic id_5,
    input  tri   id_6,
    output logic id_7
);
  assign id_7 = -1;
  assign id_7 = 1;
  initial begin : LABEL_0
    id_7 <= id_4 > !id_2;
    if (1) disable id_9;
    else id_5 <= -1;
  end
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output logic id_2,
    input tri0 id_3,
    output supply0 id_4
);
  initial id_2 = id_1;
  notif1 primCall (id_4, id_1, id_3);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_4,
      id_3,
      id_2,
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
