// Seed: 722335437
module module_0 (
    output wor id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output supply0 id_4,
    output supply0 id_5,
    input supply0 id_6,
    output tri id_7,
    input wand id_8
);
  wire id_10, id_11;
  wire id_12;
  assign id_11 = id_2;
  reg id_13;
  assign id_11 = -1;
  initial id_13 = -1'd0;
endmodule
module module_1 (
    output wand id_0,
    input supply1 id_1,
    output logic id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
  logic id_5;
  initial begin : LABEL_0
    id_2 <= 1;
    if (1) begin : LABEL_1
      id_2 <= 1;
    end
  end
endmodule
