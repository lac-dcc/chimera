// Seed: 1043520786
module module_0 (
    output wand  id_0,
    output tri0  id_1,
    input  logic id_2,
    output logic id_3
);
  always @(posedge id_2) begin : LABEL_0
    id_3 <= id_2 - id_2 ? id_2 : 1;
    id_0 = 1 ^ id_2;
  end
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    input wor id_6,
    input tri id_7,
    output uwire id_8,
    input uwire id_9,
    output wor id_10,
    input wor id_11,
    inout logic id_12
);
  assign id_12 = 1'h0 - id_11;
  assign id_8  = id_2;
  always @(*) begin : LABEL_0
    id_14(1);
    assume (id_4);
    cover (id_6);
    $display(1);
    id_12 <= id_14;
  end
  wire id_15;
  wire id_16;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_12
  );
  assign modCall_1.id_0 = 0;
  wire id_17;
  wire id_18;
  wire id_19;
endmodule
