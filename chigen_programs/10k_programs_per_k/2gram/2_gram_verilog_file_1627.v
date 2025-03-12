// Seed: 1025313958
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input supply0 id_2,
    input uwire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output supply1 id_6,
    output tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output supply1 id_10,
    output tri id_11,
    input supply0 id_12,
    input uwire id_13,
    input tri0 id_14,
    input wand id_15,
    input wire id_16,
    output wire id_17,
    output tri id_18
);
  wire [1 : 1] id_20;
  wire id_21;
endmodule
module module_1 #(
    parameter id_1 = 32'd93,
    parameter id_6 = 32'd31
) (
    input supply1 id_0,
    input wor _id_1,
    input uwire id_2,
    input supply1 id_3,
    input tri id_4,
    output tri id_5,
    input tri1 _id_6,
    input tri1 id_7,
    input wor id_8,
    input wor id_9,
    input supply1 id_10,
    output logic id_11,
    output wor id_12
);
  bit id_14;
  struct packed {
    id_15 id_16;
    logic [id_1 : id_6] id_17;
  }
      id_18, id_19, id_20, id_21;
  assign id_18 = id_10;
  assign id_18.id_16 = id_2;
  always
    for (id_14 = id_19; id_18.id_16; id_14 = -1) begin : LABEL_0
      id_11 <= 1;
    end
  wor id_22 = 1'b0, id_23, id_24;
  id_25 :
  assert property (@(posedge id_19) id_6)
  else;
  wire [-1 : -1] id_26;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_9,
      id_2,
      id_0,
      id_9,
      id_5,
      id_5,
      id_3,
      id_9,
      id_5,
      id_5,
      id_3,
      id_7,
      id_2,
      id_2,
      id_8,
      id_12,
      id_5
  );
  assign id_18.id_16 = id_0;
  logic id_27;
  wire  id_28;
endmodule
