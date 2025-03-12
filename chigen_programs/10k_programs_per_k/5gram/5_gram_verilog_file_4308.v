// Seed: 3777460049
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_2.id_2 = 0;
  wire id_4;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd81,
    parameter id_4 = 32'd16
) (
    output logic id_0,
    input  tri   _id_1
);
  logic id_3 = id_1, _id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3
  );
  always_ff @(posedge id_1) begin : LABEL_0
    id_0 = 1;
  end
  wand [id_4  ==  id_1 : id_1] id_5 = id_4, id_6 = 1;
endmodule
module module_2 (
    input wire id_0,
    output tri0 id_1,
    output uwire id_2,
    input uwire id_3,
    output tri id_4,
    input tri0 id_5,
    input wire id_6,
    input wire id_7,
    input tri0 id_8,
    input supply0 id_9,
    output wor id_10
);
  wire id_12;
  nor primCall (id_1, id_6, id_5, id_3, id_9, id_13, id_12, id_0, id_7);
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13
  );
endmodule
