// Seed: 4149862172
module module_0 (
    input wand id_0[1 : 1],
    input uwire id_1,
    input supply0 id_2,
    output supply0 id_3,
    output wand id_4
);
  always begin : LABEL_0
    @(posedge id_1) $unsigned(38);
    ;
  end
  id_6 :
  assert property (@(posedge id_0) (id_0)) $signed(87);
  ;
  wire id_7, id_8;
endmodule
module module_1 #(
    parameter id_13 = 32'd43,
    parameter id_9  = 32'd55
) (
    input tri1 id_0,
    input wor id_1,
    input uwire id_2,
    output logic id_3,
    output uwire id_4,
    output tri id_5,
    input supply1 id_6,
    input wire id_7,
    output tri1 id_8,
    input supply1 _id_9,
    output tri id_10,
    output tri0 id_11,
    input uwire id_12,
    input uwire _id_13,
    input supply0 id_14,
    output wand id_15,
    input uwire id_16,
    input wand id_17,
    input wand id_18,
    output logic id_19,
    output logic id_20,
    output tri id_21,
    input wand id_22,
    input tri1 id_23,
    input tri1 id_24,
    output logic id_25,
    input wor id_26
);
  parameter [1 : id_9  &&  id_13  -  -1] id_28 = 1;
  assign id_8 = 1;
  wire id_29;
  always begin : LABEL_0
    id_19 <= id_18;
    id_25 <= -1;
  end
  always
    cover (id_28 & id_7) begin : LABEL_1
      $signed(34);
      ;
      id_3 = id_29;
    end
  localparam id_30 = 1'b0;
  initial id_20 = id_29;
  module_0 modCall_1 (
      id_7,
      id_26,
      id_17,
      id_15,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
