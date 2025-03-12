// Seed: 3989105612
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    output wire id_3,
    input uwire id_4,
    inout tri0 id_5#(.id_17(1)),
    input wand id_6,
    input supply1 id_7,
    output logic id_8,
    input tri id_9,
    input wor id_10,
    input supply1 id_11,
    input tri0 id_12,
    input tri id_13,
    input wand id_14,
    input tri id_15
);
  struct packed {
    logic id_18;
    id_19 id_20;
  } [1 'b0 : 1] id_21;
  always_latch
    if (1'b0)
      @(*) begin : LABEL_0
        id_8 <= id_21.id_19;
      end
    else @(posedge id_14 or -1'b0) id_21.id_18 = id_13 - -1'h0;
endmodule
module module_1 #(
    parameter id_0  = 32'd15,
    parameter id_13 = 32'd57,
    parameter id_14 = 32'd8,
    parameter id_4  = 32'd95
) (
    input wor _id_0,
    output logic id_1,
    input tri1 id_2,
    input wor id_3,
    input wand _id_4,
    input supply0 id_5,
    output uwire id_6,
    inout wor id_7[id_0  ==  id_14 : (  1  <  id_13  )],
    input wire id_8,
    input wor id_9,
    input wand id_10,
    input wand id_11,
    input tri0 id_12,
    input supply0 _id_13,
    input supply1 _id_14,
    input supply0 id_15,
    input supply0 id_16,
    input wor id_17,
    input wand id_18,
    input wor id_19
);
  wire id_21, id_22;
  always id_1 = id_11;
  bit [1 'd0 : id_4] id_23, id_24;
  assign id_23 = -1;
  wire id_25;
  always begin : LABEL_0
    id_24 <= id_12;
  end
  module_0 modCall_1 (
      id_7,
      id_18,
      id_7,
      id_6,
      id_9,
      id_7,
      id_17,
      id_15,
      id_1,
      id_19,
      id_15,
      id_15,
      id_9,
      id_3,
      id_11,
      id_7
  );
  assign id_6 = id_18 && id_3;
  logic id_26, id_27 = 1;
endmodule : SymbolIdentifier
