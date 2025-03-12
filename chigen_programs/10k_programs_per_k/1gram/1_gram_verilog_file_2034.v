// Seed: 2102453855
module module_0 (
    input supply0 id_0,
    input tri id_1,
    output tri id_2,
    output uwire id_3
);
endmodule
module module_1 #(
    parameter id_8 = 32'd73
) (
    input uwire id_0,
    inout wand id_1,
    input uwire id_2,
    output wor id_3,
    input tri id_4,
    input wor id_5[1 : id_8],
    output supply0 id_6,
    output logic id_7,
    input tri0 _id_8,
    input wor id_9,
    output supply1 id_10,
    input tri0 id_11
);
  assign id_10 = id_4;
  struct packed {
    logic id_13;
    logic id_14;
    logic id_15;
  } id_16;
  always begin : LABEL_0
    id_7 <= id_9;
  end
  wire id_17;
  wire id_18;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_3,
      id_1
  );
endmodule
