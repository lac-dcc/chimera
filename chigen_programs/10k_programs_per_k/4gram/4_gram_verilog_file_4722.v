// Seed: 2657180553
module module_0 (
    input tri0 id_0
    , id_10, id_11,
    input tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input uwire id_4,
    output wand id_5,
    input supply1 id_6,
    input wire id_7,
    output supply1 id_8
);
  genvar id_12;
  assign id_5 = -1'b0;
  logic id_13, id_14;
endmodule
module module_1 (
    output supply0 id_0,
    inout wire id_1,
    output wor id_2
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 #(
    parameter id_5 = 32'd58,
    parameter id_6 = 32'd53
) (
    input tri id_0,
    output tri1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    output logic id_4,
    input tri _id_5,
    input wire _id_6,
    input tri id_7,
    input supply0 id_8,
    output tri1 id_9
);
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_0,
      id_8,
      id_1,
      id_7,
      id_8,
      id_9
  );
  assign id_2 = (1);
  initial begin : LABEL_0
    id_4 <= id_0;
  end
  logic [7:0] id_11[-1 : id_6] = id_11[id_5 : 1'b0];
  assign id_9 = 1;
  assign id_9 = -1;
  localparam id_12 = 1;
endmodule
