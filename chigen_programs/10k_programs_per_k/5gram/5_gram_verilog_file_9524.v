// Seed: 1194155012
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output tri1 id_2,
    output tri0 id_3
);
  assign id_3 = id_0;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd60,
    parameter id_2 = 32'd52
) (
    input supply0 _id_0,
    output uwire id_1,
    input wor _id_2,
    input tri1 id_3,
    input tri1 id_4,
    output tri id_5,
    input wand id_6,
    output logic id_7
);
  initial begin : LABEL_0
    id_7 <= id_6;
  end
  uwire [-1 : id_2  >=  id_0] id_9;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_1,
      id_1
  );
  assign id_9 = "" == -1;
  xnor primCall (id_1, id_3, id_6, id_9);
  assign id_1 = 1;
endmodule
