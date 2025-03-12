// Seed: 3285875970
module module_0 (
    input tri0 id_0,
    input wor id_1,
    output logic id_2,
    output wand id_3,
    input wand id_4,
    output logic id_5,
    input uwire id_6,
    output logic id_7,
    output supply0 id_8,
    input wire id_9,
    input wire id_10,
    input tri0 id_11,
    input uwire id_12
    , id_21,
    input uwire id_13,
    input supply1 id_14,
    output supply0 id_15,
    output wand id_16,
    output wire id_17,
    input supply0 id_18,
    input tri1 id_19
);
  assign id_15 = id_6;
  reg [-1 : -1] id_22, id_23, id_24;
  final begin : LABEL_0
    if (1) id_2 = 1'b0;
    else
      fork
        if (1) if (1) id_24 = 1'b0;
      join
  end
  bit id_25 = id_22;
  assign id_23 = 1;
  initial
    if (1)
      for (id_22 = !-1; id_18; id_5 = 1) begin : LABEL_1
        id_24 = id_19;
        id_7 <= id_6;
        for (id_15 = id_12; id_24; id_5 = id_4) id_25 = id_19;
      end
    else disable id_26;
  id_27 :
  assert property (@(posedge id_4) {id_0{1}})
  else
    assert (id_13)
      `define pp_28 0
  assign id_27 = id_13;
  assign id_7  = id_18 == id_14;
  always @(1) begin : LABEL_2
    @(negedge -1 or posedge -1, "")
    @(posedge id_14 or posedge id_27 or posedge 1 or -1)
    `pp_28 <= -1'b0;
    id_25 = id_10;
  end
  assign id_24 = id_21;
  logic id_29 = -1;
  initial id_22 = id_23;
endmodule
module module_1 (
    input  tri   id_0,
    output wor   id_1,
    output logic id_2,
    input  tri0  id_3,
    input  tri   id_4,
    output wire  id_5
);
  always id_2 <= -1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_4,
      id_2,
      id_1,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_3,
      id_5,
      id_5,
      id_5,
      id_4,
      id_3
  );
  assign modCall_1.id_7 = 0;
endmodule
