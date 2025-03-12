// Seed: 1091611124
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  localparam id_4 = 1;
  assign module_2.id_1 = 0;
  logic [7:0][-1 : 1] id_5;
  ;
endmodule
module module_1;
  parameter id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_1  = 32'd94,
    parameter id_13 = 32'd84,
    parameter id_5  = 32'd75
) (
    output tri0 id_0,
    input supply1 _id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    input supply0 _id_5,
    output uwire id_6,
    input uwire id_7,
    output tri1 id_8,
    input wire id_9,
    input supply0 id_10,
    input wor id_11,
    output uwire id_12[id_1 : 1],
    input tri0 _id_13
);
  wire [id_13 : 1] id_15;
  module_0 modCall_1 (
      id_15,
      id_15,
      id_15
  );
  logic id_16[-1 'b0 : id_5];
  assign id_15 = id_10;
  nor primCall (id_8, id_9, id_3, id_15, id_2, id_4, id_11, id_7, id_10);
endmodule
