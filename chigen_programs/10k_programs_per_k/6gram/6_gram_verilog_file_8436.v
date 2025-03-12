// Seed: 938669737
module module_0 (
    output tri1 id_0,
    input wire id_1,
    input wire id_2
    , id_17,
    output tri1 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input wand id_7,
    output tri1 id_8,
    input wor id_9,
    input tri id_10,
    input supply1 id_11,
    input tri1 id_12,
    input wire id_13,
    input tri1 id_14,
    output uwire id_15
);
  assign id_8 = -1;
  localparam id_18 = 1'b0;
  logic [1 : -1] id_19;
  ;
  wire id_20;
  ;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    input uwire id_2,
    output logic id_3,
    output supply0 id_4
);
  parameter id_6 = -1;
  always @(posedge id_2) id_3 = #1 -1;
  wire id_7;
  ;
  always @(posedge 1) begin : LABEL_0
    id_3 <= id_0;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_4,
      id_2,
      id_0,
      id_1,
      id_1,
      id_4,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_4
  );
  assign modCall_1.id_9 = 0;
endmodule
