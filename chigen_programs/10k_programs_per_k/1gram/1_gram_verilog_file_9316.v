// Seed: 2607515507
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output tri1 id_2,
    input wire id_3#(
        .id_15(1'b0),
        .id_16(1),
        .id_17(-1),
        .id_18(1),
        .id_19(-1)
    ),
    input tri1 id_4,
    input tri id_5,
    output tri1 id_6,
    output tri0 id_7,
    input tri0 id_8,
    input supply1 id_9[-1 : -1],
    output tri0 id_10,
    input tri0 id_11,
    input wand id_12,
    input wand id_13
);
  wire id_20;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd24
) (
    input supply1 _id_0,
    output wire id_1,
    output tri1 id_2,
    input wor id_3
);
  logic [7:0][-1 : id_0] id_5;
  final id_5[""] <= "";
  wor id_6, id_7 = id_5 & -1'b0;
  parameter id_8 = 1'b0;
  logic id_9 = -1;
  wire [(  -1  ) : id_0] id_10;
  always @(posedge id_10);
  assign id_7 = id_8;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3
  );
endmodule
