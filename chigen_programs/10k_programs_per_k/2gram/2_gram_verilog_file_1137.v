// Seed: 2537513662
module module_0 (
    output uwire id_0
);
  wire id_2, id_3;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    output tri id_2,
    input wor id_3,
    output tri0 id_4
    , id_18,
    input tri id_5,
    input tri1 id_6,
    output wor id_7,
    input tri id_8,
    output tri1 id_9,
    input uwire id_10,
    inout wor id_11,
    input supply1 id_12,
    input tri1 id_13,
    output tri1 id_14,
    output logic id_15,
    input tri1 id_16
);
  assign id_7 = 1'b0;
  wire id_19;
  tri1 id_20;
  always #1 id_15 <= 1;
  assign id_15 = 1;
  always begin : LABEL_0
    assume #1  (id_12);
    else;
  end
  assign id_20 = id_16;
  xor primCall (
      id_15, id_5, id_0, id_12, id_18, id_3, id_6, id_10, id_13, id_16, id_8, id_11, id_19
  );
  module_0 modCall_1 (id_20);
endmodule
