// Seed: 352417465
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output supply0 id_3
);
  assign id_3 = 1'h0;
  wire id_5;
  ;
  assign module_2.id_0 = 0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wor id_1,
    output supply1 id_2,
    input supply1 id_3,
    output supply1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1
  );
  wire id_7;
  ;
  wire id_8, id_9;
endmodule
module module_2 (
    output wor id_0
    , id_18,
    output tri0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    output supply0 id_4,
    input uwire id_5,
    input supply1 id_6,
    output wor id_7,
    input wire id_8,
    input tri1 id_9,
    input wand id_10,
    output uwire id_11,
    input tri0 id_12,
    output logic id_13,
    input wor id_14,
    input tri1 id_15,
    output supply0 id_16
);
  assign id_3 = id_18;
  wire id_19;
  wire id_20;
  assign id_11 = id_19 - -1;
  nor primCall (
      id_4, id_9, id_18, id_14, id_6, id_2, id_20, id_19, id_15, id_12, id_10, id_5, id_8
  );
  module_0 modCall_1 (
      id_15,
      id_14,
      id_6,
      id_4
  );
  always @(posedge id_6) begin : LABEL_0
    if (1) disable id_21;
    else id_13 <= -1;
  end
endmodule
