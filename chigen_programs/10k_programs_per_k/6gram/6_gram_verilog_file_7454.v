// Seed: 2158796500
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input supply0 id_2,
    output uwire id_3,
    input uwire id_4,
    input wor id_5,
    input supply1 id_6,
    input wor id_7,
    input supply1 id_8,
    input supply1 id_9,
    input tri0 id_10,
    input wire id_11,
    input wand id_12,
    output logic id_13
);
  wire id_15;
  always @(posedge id_10 or posedge 1) begin : LABEL_0
    id_13 <= -1;
  end
  wire [(  -1 'b0 ) : 1] id_16;
  assign id_0 = id_15;
  logic id_17;
  ;
endmodule
module module_1 (
    input  wand  id_0,
    input  wire  id_1,
    input  tri   id_2,
    output tri1  id_3,
    output wor   id_4,
    input  tri0  id_5,
    output uwire id_6,
    output wor   id_7
    , id_12,
    output tri0  id_8,
    output uwire id_9,
    output logic id_10
);
  always @(negedge 1'h0 or posedge id_2)
    if (1) begin : LABEL_0
      if (-1) id_10 = id_0;
    end else begin : LABEL_1
      id_12 <= id_0;
    end
  module_0 modCall_1 (
      id_8,
      id_4,
      id_2,
      id_8,
      id_1,
      id_5,
      id_5,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_5,
      id_10
  );
  assign modCall_1.id_7 = 0;
endmodule
