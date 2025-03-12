// Seed: 3590569494
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    input tri id_2,
    output tri id_3,
    output uwire id_4,
    input wand id_5,
    input wand id_6,
    input tri id_7,
    input wire id_8,
    output uwire id_9,
    output tri0 id_10
);
  supply1 id_12 = -1'd0;
  logic id_13, id_14, id_15;
endmodule
module module_1 #(
    parameter id_7 = 32'd57
) (
    input  tri   id_0,
    output tri0  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    output logic id_4
);
  assign id_1 = -1;
  wire id_6;
  wire _id_7;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_1,
      id_1
  );
  always id_4 <= #1 1;
  wire id_8;
  logic [7:0] id_9;
  always @(posedge 1 or posedge id_9) if (-1) id_4 <= id_9[id_7];
endmodule
