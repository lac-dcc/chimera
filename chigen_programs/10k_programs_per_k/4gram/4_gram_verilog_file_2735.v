// Seed: 2142521707
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input tri id_2,
    input wand id_3,
    input uwire id_4,
    output supply0 id_5,
    input wire id_6,
    output tri0 id_7,
    output wor id_8,
    output tri1 id_9,
    input supply1 id_10,
    output tri1 id_11,
    input uwire id_12
);
  assign id_8 = 1'd0;
  wire id_14;
  ;
  wire id_15;
  wire id_16;
  assign module_1.id_2 = 0;
  wire id_17;
endmodule
module module_1 (
    output tri id_0,
    input tri id_1,
    output logic id_2,
    output supply1 id_3
);
  always @(posedge -1'b0) begin : LABEL_0
    $clog2(76);
    ;
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_0,
      id_1,
      id_0,
      id_1
  );
endmodule
