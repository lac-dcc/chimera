// Seed: 2578367066
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input wor id_2,
    output logic id_3
);
  always begin : LABEL_0
    id_3 = id_1;
  end
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output logic id_6,
    input uwire id_7,
    input tri id_8,
    output tri id_9
);
  wire id_11;
  always begin : LABEL_0
    @(posedge -1);
  end
  bit [-1 : $realtime] id_12;
  always
    if (1) begin : LABEL_1
      #1 @(id_2);
      id_6  = id_0;
      id_12 = id_1;
    end
  module_0 modCall_1 (
      id_5,
      id_4,
      id_8,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
