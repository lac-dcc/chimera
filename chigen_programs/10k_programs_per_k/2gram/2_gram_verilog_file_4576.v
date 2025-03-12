// Seed: 3859395022
module module_0 (
    output tri id_0,
    output tri0 id_1,
    input tri1 id_2,
    output tri id_3,
    input uwire id_4,
    input uwire id_5,
    output wire id_6,
    input supply1 id_7,
    input tri0 id_8,
    input tri0 id_9,
    output supply1 id_10,
    output supply0 id_11,
    input supply1 id_12,
    input tri0 id_13
);
  wire id_15;
  assign id_1 = 1;
endmodule
module module_1 (
    output wire  id_0,
    output logic id_1,
    output uwire id_2,
    input  uwire id_3
);
  always
    if (1)
      @(posedge id_3) begin : LABEL_0
        id_1 <= -1;
      end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
  assign id_1 = id_3.sum;
endmodule
