// Seed: 714048255
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri id_2,
    input tri0 id_3,
    output tri1 id_4,
    output tri1 id_5,
    output tri0 id_6,
    output tri id_7,
    output wire id_8,
    input wor id_9
    , id_12,
    input wire id_10
);
  assign id_8 = 1'b0;
  wire id_13;
  ;
  parameter id_14 = 1;
endmodule
module module_1 (
    output tri id_0,
    input uwire id_1,
    output logic id_2,
    output wand id_3,
    input wire id_4,
    input wor id_5,
    input supply0 id_6
);
  always @(posedge -1) begin : LABEL_0
    id_2 = id_6;
  end
  module_0 modCall_1 (
      id_4,
      id_5,
      id_6,
      id_1,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_5,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
