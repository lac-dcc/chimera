// Seed: 2968977302
module module_0 (
    input wor id_0,
    input supply0 id_1,
    output uwire id_2,
    input supply1 id_3
);
  logic [-1 : 1] id_5 = "", id_6;
  assign module_1.id_12 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd41,
    parameter id_9  = 32'd70
) (
    output wire id_0,
    input tri0 id_1
    , id_15,
    output logic id_2,
    input supply0 id_3,
    input wor id_4,
    input tri0 id_5
    , id_16,
    input wor id_6,
    input uwire id_7,
    output wor id_8,
    input wor _id_9,
    input tri id_10,
    input tri1 id_11,
    input tri id_12
    , id_17, id_18,
    input wand _id_13
);
  wire id_19;
  ;
  logic [1 : id_13  ==  id_9] id_20;
  parameter id_21 = 1;
  nor primCall (
      id_8,
      id_19,
      id_3,
      id_18,
      id_20,
      id_11,
      id_17,
      id_5,
      id_21,
      id_6,
      id_10,
      id_15,
      id_7,
      id_1,
      id_16,
      id_12
  );
  assign id_8 = 1'b0;
  always @(posedge -1) begin : LABEL_0
    id_2 <= ~id_20;
  end
  assign id_17 = -1'd0 - 1;
  assign id_0  = id_4;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_0,
      id_4
  );
  assign id_16 = -1'b0;
  wire [1 : 1 'h0] id_22;
endmodule
