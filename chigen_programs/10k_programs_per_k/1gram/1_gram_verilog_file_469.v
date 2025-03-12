// Seed: 3141113298
module module_0 (
    output supply0 id_0,
    input wand id_1,
    input wor id_2,
    output tri0 id_3,
    output tri id_4
    , id_17,
    input tri1 id_5,
    input wand id_6,
    output uwire id_7
    , id_18,
    output uwire id_8,
    output wire id_9,
    input uwire id_10,
    input supply1 id_11,
    input tri1 id_12,
    output supply1 id_13,
    output tri1 id_14,
    output tri1 id_15
);
  assign id_3 = 1'b0;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    input tri0 id_2,
    input wor id_3,
    input supply1 id_4,
    output supply1 id_5,
    input tri id_6,
    input tri id_7,
    input supply1 id_8,
    output supply0 id_9,
    input tri id_10,
    output logic id_11,
    output wand id_12,
    input tri0 id_13,
    output logic id_14,
    output tri0 id_15,
    input uwire id_16,
    input wand id_17,
    input supply0 id_18
);
  reg id_20, id_21;
  module_0 modCall_1 (
      id_12,
      id_13,
      id_7,
      id_5,
      id_9,
      id_3,
      id_6,
      id_12,
      id_15,
      id_15,
      id_16,
      id_10,
      id_13,
      id_15,
      id_9,
      id_9
  );
  logic id_22;
  ;
  wire id_23;
  always begin : LABEL_0
    logic id_24 = id_22[-1'b0];
    if (1'b0) begin : LABEL_1
      id_11 = id_3;
    end else id_14 = #1 id_3;
  end
  wire id_25;
  always id_21 = id_23 !== id_6;
  id_26 :
  assert property (@(id_25) -1);
  assign id_25 = id_2;
endmodule
