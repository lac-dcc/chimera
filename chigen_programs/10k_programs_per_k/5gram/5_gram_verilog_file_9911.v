// Seed: 503525381
module module_0 (
    input  wire id_0,
    output wor  id_1,
    input  tri0 id_2,
    output wand id_3,
    input  tri0 id_4,
    output wand id_5,
    output tri0 id_6
);
  wire id_8;
  wire id_9;
  ;
  assign module_1.id_19 = 0;
  wire id_10;
endmodule
module module_1 #(
    parameter id_13 = 32'd95
) (
    output wor id_0,
    input uwire id_1,
    output tri0 id_2,
    input tri1 id_3,
    output wor id_4,
    output wand id_5,
    input supply1 id_6,
    output wor id_7,
    input supply1 id_8,
    output logic id_9,
    output wor id_10,
    input supply1 id_11,
    input tri0 id_12,
    input wor _id_13,
    input tri0 id_14,
    output uwire id_15,
    output tri id_16,
    output wor id_17,
    input wor id_18,
    output uwire id_19,
    input wire id_20,
    input tri id_21,
    input tri id_22
    , id_38,
    output wand id_23,
    output wire id_24,
    input tri1 id_25,
    input tri0 id_26,
    input wire id_27,
    input tri id_28,
    input tri0 id_29,
    input tri id_30,
    input uwire id_31,
    input tri1 id_32,
    output logic id_33,
    input supply1 id_34,
    output wire id_35,
    input wire id_36
);
  wire id_39;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_18,
      id_19,
      id_12,
      id_16,
      id_24
  );
  assign id_16 = id_1(1);
  wire id_40;
  always @(posedge id_40) begin : LABEL_0
    begin : LABEL_1
      id_9  <= id_38[1-:id_13] == "";
      id_33 <= id_30 !=? 1'b0;
    end
  end
  wire [1 : -1] id_41;
  assign id_15 = 1'b0 - -1;
endmodule
