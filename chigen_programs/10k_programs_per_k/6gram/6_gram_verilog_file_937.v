// Seed: 2241679608
module module_0 #(
    parameter id_11 = 32'd59,
    parameter id_5  = 32'd19
);
  bit id_1, id_2, id_3, id_4, _id_5, id_6, id_7, id_8, id_9, id_10, _id_11;
  wire id_12;
  parameter id_13 = 1;
  assign module_1.id_3 = 0;
  wire [1 : id_5  ~^  id_11] id_14;
  always @(posedge id_2 or id_7 < id_10) begin : LABEL_0
    if (id_13) id_3 <= #1 -1;
  end
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    output tri1 id_2,
    input wor id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wire id_6,
    output tri0 id_7,
    input wand id_8,
    input wor id_9,
    input tri0 id_10,
    input wire id_11,
    output supply0 id_12,
    input tri id_13,
    input tri1 id_14,
    input tri0 id_15,
    output uwire id_16,
    input wand id_17
);
  parameter id_19 = 1;
  wire id_20;
  module_0 modCall_1 ();
  always begin : LABEL_0
    id_0 = id_1;
  end
  xnor primCall (
      id_0,
      id_1,
      id_10,
      id_11,
      id_13,
      id_14,
      id_15,
      id_17,
      id_19,
      id_20,
      id_3,
      id_4,
      id_5,
      id_6,
      id_8,
      id_9
  );
endmodule
