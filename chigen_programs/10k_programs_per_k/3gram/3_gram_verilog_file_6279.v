// Seed: 1637947992
module module_0 #(
    parameter id_0 = 32'd20
) (
    input wor _id_0,
    output supply1 id_1,
    input tri0 id_2,
    output tri0 id_3,
    output wand id_4,
    input wire id_5,
    output uwire id_6,
    output wire id_7,
    output wor id_8,
    output tri id_9,
    input supply0 id_10,
    input tri0 id_11,
    input supply1 id_12,
    output tri id_13,
    output tri1 id_14,
    input tri0 id_15,
    output wor id_16,
    input wire id_17,
    output supply1 id_18,
    input tri id_19,
    output tri1 id_20,
    input wire id_21,
    input wor id_22
);
  always #1 begin : LABEL_0
    $clog2(5);
    ;
  end
  logic [id_0 : -1] id_24;
  generate
    wire id_25;
    ;
  endgenerate
  wire id_26;
endmodule
module module_1 #(
    parameter id_6 = 32'd73
) (
    output wire id_0,
    input supply0 id_1,
    output logic id_2,
    input wire id_3,
    output uwire id_4,
    input supply1 id_5,
    input uwire _id_6
);
  id_8 :
  assert property (@(posedge 1) id_5)
  else id_2 <= -1;
  assign #id_9 id_4 = id_6;
  wire id_10;
  wire [id_6 : 1  -  1  |  -1] id_11;
  module_0 modCall_1 (
      id_9,
      id_4,
      id_3,
      id_4,
      id_4,
      id_1,
      id_0,
      id_4,
      id_0,
      id_4,
      id_1,
      id_3,
      id_5,
      id_0,
      id_4,
      id_5,
      id_4,
      id_3,
      id_4,
      id_5,
      id_4,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
