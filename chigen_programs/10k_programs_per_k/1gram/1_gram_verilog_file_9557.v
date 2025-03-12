// Seed: 1557159630
module module_0 (
    input wire id_0,
    output wand id_1,
    input tri1 id_2,
    input wor id_3,
    output wor id_4,
    input wire id_5,
    input tri id_6,
    input tri id_7,
    output supply0 id_8,
    output tri0 id_9,
    input wire id_10,
    output uwire id_11,
    output wire id_12,
    output wor id_13,
    input tri id_14,
    input uwire id_15,
    output wand id_16,
    input wand id_17,
    input tri0 id_18,
    input tri id_19,
    input tri1 id_20
);
  wire ["" ==  -1 : -1] id_22;
  wire id_23;
  assign id_8 = id_3;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_1  = 32'd42,
    parameter id_19 = 32'd30,
    parameter id_4  = 32'd91
) (
    output wand id_0,
    input uwire _id_1,
    output logic id_2,
    input supply1 id_3,
    input tri1 _id_4,
    input tri id_5,
    output logic id_6,
    input logic id_7,
    output logic id_8,
    output wand id_9,
    input wand id_10,
    input supply0 id_11,
    input tri0 id_12
);
  logic id_14;
  assign id_0 = -1;
  assign id_8 = 1;
  always_ff
    if (1)
      if ((1)) id_2 <= id_4 ^ id_3;
      else begin : LABEL_0
        for (id_14 = 1; 1; id_14.id_7 = id_5) id_6 <= id_3;
        id_2 <= 1'b0;
        id_8 = 1;
      end
  assign id_0 = id_5;
  wor [id_1 : id_4] id_15, id_16, id_17;
  assign id_0  = (id_7);
  assign id_15 = -1;
  module_0 modCall_1 (
      id_5,
      id_9,
      id_3,
      id_3,
      id_9,
      id_3,
      id_3,
      id_3,
      id_0,
      id_9,
      id_10,
      id_0,
      id_0,
      id_0,
      id_3,
      id_10,
      id_0,
      id_11,
      id_3,
      id_5,
      id_11
  );
  assign id_15 = id_3;
  logic id_18;
  assign id_15 = id_5;
  wire _id_19;
  wire [id_19 : -1] id_20, id_21, id_22;
endmodule
