// Seed: 2358752033
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output uwire id_2,
    input tri0 id_3,
    output tri0 id_4,
    output tri0 id_5,
    output tri id_6,
    input uwire id_7,
    output wire id_8,
    input wand id_9
);
  wire id_11;
  localparam id_12 = -1;
  assign id_8 = id_0;
endmodule
module module_1 #(
    parameter id_2 = 32'd78,
    parameter id_4 = 32'd37
) (
    input supply1 id_0,
    output wire id_1,
    output supply1 _id_2[-1 : id_4],
    input uwire id_3,
    input supply1 _id_4,
    input tri0 id_5#(
        .id_20(-1),
        .id_21(1)
    ),
    output logic id_6,
    output supply0 id_7,
    input wand id_8,
    output tri1 id_9,
    input tri0 id_10,
    input supply0 id_11,
    output tri0 id_12,
    input tri id_13,
    output logic id_14,
    output uwire id_15[1 : id_2  -  1],
    input wand id_16,
    output logic id_17#(1, 1),
    output supply0 id_18
);
  assign id_15 = id_20;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_12,
      id_5,
      id_1,
      id_7,
      id_7,
      id_11,
      id_15,
      id_8
  );
  assign modCall_1.id_3 = 0;
  always begin : LABEL_0
    id_17 = "";
    id_14 = 1;
    begin : LABEL_1
      if (1);
    end
  end
  always id_6 = id_16;
  assign id_18 = -1;
  assign id_12 = id_8.id_0 & 1 <= -1;
endmodule
