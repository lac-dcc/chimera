// Seed: 3410052163
module module_0 (
    input supply0 id_0,
    output tri id_1
    , id_17,
    output supply1 id_2,
    output uwire id_3,
    input supply0 id_4,
    input wor id_5,
    input wand id_6,
    input supply1 module_0,
    input tri id_8,
    input supply1 id_9,
    output uwire id_10,
    output wand id_11,
    output tri0 id_12,
    input tri0 id_13,
    input supply0 id_14,
    output wor id_15
);
  logic id_18;
  ;
endmodule
program module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    output tri1  id_2,
    input  wand  id_3,
    input  tri   id_4,
    input  wire  id_5,
    input  uwire id_6,
    input  wand  id_7,
    input  tri0  id_8
);
  integer id_10 = id_3;
  assign id_10 = id_5;
  logic [7:0]
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24;
  always @(posedge -1'b0 or posedge id_20) begin : LABEL_0
    id_10 = #id_25  ~id_5;
  end
  always @(posedge -1) begin : LABEL_1
    disable id_26;
  end
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2,
      id_2,
      id_8,
      id_7,
      id_0,
      id_4,
      id_7,
      id_8,
      id_2,
      id_2,
      id_2,
      id_7,
      id_1,
      id_2
  );
  assign id_17[-1] = id_20;
endprogram
