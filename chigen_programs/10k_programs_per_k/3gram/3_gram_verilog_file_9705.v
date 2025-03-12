// Seed: 2032654247
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri0 id_3,
    input tri0 id_4,
    input uwire id_5,
    output wire id_6,
    input uwire id_7,
    input supply0 id_8,
    output tri id_9,
    input supply1 id_10,
    output tri0 id_11,
    output uwire id_12,
    input wor id_13
    , id_28,
    input wor id_14
    , id_29,
    input supply1 id_15,
    output tri1 id_16,
    output wire id_17,
    input uwire id_18,
    input wor id_19,
    output supply0 id_20,
    input supply0 id_21,
    input wand id_22,
    input supply1 id_23,
    input supply1 id_24,
    input wor id_25,
    input tri id_26
);
endmodule
module module_1 #(
    parameter id_6 = 32'd58
) (
    input uwire id_0,
    output supply0 id_1,
    input tri1 id_2,
    output logic id_3
);
  always @(posedge id_2) begin : LABEL_0
    id_3 <= id_0;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign id_1 = 1;
  bit id_5;
  wire _id_6;
  wire [id_6 : 1] id_7;
  xnor primCall (id_3, id_2, id_0);
  assign id_1 = id_0;
  wire id_8;
  assign id_1 = 1;
  always @(posedge -1'b0 or posedge 1) id_5 = 1;
endmodule
