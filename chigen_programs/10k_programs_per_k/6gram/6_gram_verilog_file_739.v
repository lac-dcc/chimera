// Seed: 3114368049
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input tri0 id_2,
    output wire id_3,
    input wor id_4,
    input supply1 id_5,
    input wor id_6,
    output tri1 id_7,
    input tri0 id_8,
    input wire id_9,
    input wand id_10,
    output wire id_11,
    output tri0 id_12
);
  wire id_14;
  ;
  always @(posedge 1) begin : LABEL_0
    ;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    inout supply0 id_2,
    output tri0 id_3,
    input supply1 id_4
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_3,
      id_4,
      id_2,
      id_2,
      id_0,
      id_4,
      id_4,
      id_2,
      id_1,
      id_3
  );
endmodule
