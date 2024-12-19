// Seed: 2472734934
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input wire id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wor id_6,
    output wor id_7,
    output wire id_8,
    output supply1 id_9,
    input tri1 id_10,
    input tri1 id_11
    , id_18,
    input wor id_12,
    input wor id_13,
    output uwire id_14,
    input tri1 id_15,
    output supply1 id_16
);
  wire id_19;
  wire id_20;
  wire id_21;
  initial begin : LABEL_0
    id_18 <= (id_2 ? 1 : 1 ^ 1'b0);
    begin : LABEL_0$display
      ;
    end
  end
endmodule
module module_1 (
    input  wor   id_0,
    output logic id_1,
    output wor   id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.type_1 = 0;
  assign id_2 = 0;
  always @(posedge id_4) begin : LABEL_0
    id_1 <= 1;
  end
endmodule
