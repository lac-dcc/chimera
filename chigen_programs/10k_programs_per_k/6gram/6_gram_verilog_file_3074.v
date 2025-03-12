// Seed: 1886248731
module module_0 (
    input tri id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri id_5,
    output tri1 id_6,
    output uwire id_7,
    input tri id_8,
    output logic id_9,
    input wor id_10,
    input tri id_11,
    input supply1 id_12,
    output uwire id_13
);
  always @* begin : LABEL_0
    id_9 = id_10;
  end
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output tri id_2,
    output wand id_3,
    output tri1 id_4,
    output supply0 id_5,
    input tri0 id_6,
    output tri1 id_7,
    input wand id_8,
    output supply0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    output supply1 id_12,
    input wire id_13,
    input supply1 id_14,
    output tri0 id_15,
    input uwire id_16,
    input supply0 id_17,
    output logic id_18,
    input wire id_19,
    output supply0 id_20,
    input uwire id_21,
    input supply1 id_22,
    input wire id_23,
    input uwire id_24,
    input uwire id_25,
    output wire id_26,
    input tri1 id_27,
    input tri id_28,
    input supply1 id_29,
    input tri0 id_30,
    input wire id_31
);
  always @(posedge id_14 or posedge id_29) begin : LABEL_0
    id_18 <= id_16;
  end
  module_0 modCall_1 (
      id_6,
      id_4,
      id_27,
      id_6,
      id_19,
      id_19,
      id_20,
      id_15,
      id_14,
      id_18,
      id_14,
      id_25,
      id_25,
      id_5
  );
  localparam id_33 = -1'b0;
  logic id_34;
  ;
  assign id_20 = 1;
  reg id_35, id_36, id_37, id_38, id_39, id_40, id_41, id_42;
  wire id_43;
  always
    repeat (id_31)
      if (1) begin : LABEL_1
        id_34 = 1;
      end else begin : LABEL_2
        id_35 = id_28;
        if (-1'b0) disable id_44;
        else assume (id_35 || id_41 < id_29 && id_19 == 1 || id_43 !== id_22);
      end
endmodule
