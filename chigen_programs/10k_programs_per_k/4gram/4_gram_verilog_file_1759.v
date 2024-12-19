// Seed: 4159737681
module module_0 (
    output wand id_0,
    output wand id_1,
    input tri id_2,
    input supply0 id_3
    , id_6,
    output wand id_4
);
  assign module_1.id_20 = 0;
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    input wor id_2
    , id_36,
    input wor id_3,
    input wor id_4,
    output tri0 id_5,
    input wand id_6,
    output logic id_7,
    input wand id_8,
    input uwire id_9,
    input tri0 id_10,
    input tri1 id_11,
    input wand id_12,
    input supply0 id_13,
    input logic id_14,
    output tri id_15,
    input tri id_16,
    input logic id_17,
    output wor id_18,
    input supply0 id_19,
    input supply1 id_20,
    input tri1 id_21,
    output logic id_22,
    output tri1 id_23,
    input tri1 id_24,
    input tri0 id_25,
    input tri0 id_26,
    input supply0 id_27,
    input wire id_28,
    input wor id_29,
    output tri0 id_30,
    input tri id_31,
    input tri id_32,
    input supply0 id_33,
    input uwire id_34
);
  reg id_37;
  initial
    forever begin : LABEL_0
      id_1 = #1 1'b0;
      id_7 += 1;
    end
  assign id_22 = id_17;
  assign id_37 = 1;
  assign id_22 = 1 >= id_4;
  or primCall (
      id_15,
      id_16,
      id_19,
      id_4,
      id_13,
      id_26,
      id_28,
      id_36,
      id_9,
      id_2,
      id_6,
      id_10,
      id_0,
      id_27,
      id_25,
      id_12,
      id_24,
      id_8,
      id_3,
      id_21,
      id_37,
      id_33,
      id_17,
      id_31,
      id_29,
      id_20,
      id_32,
      id_11
  );
  module_0 modCall_1 (
      id_18,
      id_5,
      id_24,
      id_27,
      id_15
  );
  always @(1 or ~id_19) begin : LABEL_0
    assume (1);
    if (id_11) begin : LABEL_0
      id_7 <= id_14;
    end else if (id_3) id_22 <= id_37;
  end
  wire id_38;
  wire id_39;
  wire id_40 = id_2;
endmodule
