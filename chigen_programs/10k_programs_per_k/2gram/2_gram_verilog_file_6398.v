// Seed: 4150714753
module module_0 (
    output logic id_0,
    input  tri1  id_1
);
  always begin : LABEL_0
    if (1)
      #1 begin : LABEL_1
        fork
          id_0 = 1;
          id_0 <= id_1;
          id_0 = id_1;
        join
      end
    else #1;
  end
  assign module_1.id_14 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd69,
    parameter id_22 = 32'd17
) (
    output tri1 id_0,
    input wire id_1,
    input uwire id_2,
    input wor id_3,
    output wand id_4,
    input tri0 id_5,
    output wor id_6,
    output logic id_7,
    input tri1 id_8,
    input wand id_9,
    output tri0 id_10,
    input supply1 id_11,
    input supply1 id_12,
    input tri id_13,
    input wor _id_14,
    input tri0 id_15,
    output supply1 id_16,
    input tri0 id_17,
    input supply0 id_18,
    output uwire id_19,
    input supply1 id_20
);
  logic _id_22 = id_1;
  wire [id_22 : id_14] id_23;
  always @(id_22) id_7 = 1;
  module_0 modCall_1 (
      id_7,
      id_13
  );
endmodule
