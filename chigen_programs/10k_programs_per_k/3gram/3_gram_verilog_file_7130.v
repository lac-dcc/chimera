// Seed: 2124083024
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input uwire id_2,
    output supply1 id_3,
    output uwire id_4,
    input supply1 id_5,
    input wire id_6,
    input supply0 id_7,
    input wire id_8,
    output uwire id_9
);
  logic [1 : 1] id_11 = id_2;
  assign module_1.id_20 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd67
) (
    input supply1 id_0,
    input tri id_1,
    input wire id_2
    , id_11#(
        .id_12(1 + 1 == 1),
        .id_13(1),
        .id_14(1),
        .id_15(-1),
        .id_16(-1)
    ),
    input wire _id_3,
    input tri1 id_4,
    output supply1 id_5
    , id_17,
    output tri1 id_6,
    output tri id_7,
    input wand id_8,
    output supply0 id_9
);
  assign id_9 = -1;
  integer id_18 = id_16;
  assign id_14 = id_15;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_2,
      id_5,
      id_9,
      id_4,
      id_8,
      id_1,
      id_8,
      id_7
  );
  wire id_19;
  always @(id_11 - 1 or posedge id_3) begin : LABEL_0
    $clog2(49);
    ;
  end
  xnor primCall (
      id_7, id_16, id_17, id_14, id_4, id_12, id_15, id_8, id_11, id_13, id_18, id_0, id_1, id_2
  );
  logic [1 : id_3] id_20 = (id_4 && 1) & (-1);
  assign id_9 = -1;
  wire id_21, id_22;
  parameter id_23 = 1;
endmodule
