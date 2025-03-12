// Seed: 3663330470
module module_0 (
    output logic id_0,
    input  tri   id_1,
    input  wire  id_2,
    input  tri   id_3
);
  always @(id_1) id_0 = id_3;
  wire [-1 : -1] id_5;
endmodule
module module_1 (
    output logic id_0,
    output tri0 id_1,
    output logic id_2,
    output logic id_3,
    input wand id_4,
    input tri1 id_5,
    output supply1 id_6
);
  wire id_8;
  ;
  always_ff begin : LABEL_0
    if (1) id_3 <= id_4;
    else begin : LABEL_1
      #1 begin : LABEL_2
        id_2 <= id_4;
      end
    end
    id_0 = 1;
  end
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
