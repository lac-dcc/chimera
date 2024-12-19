// Seed: 1579197410
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  generate
    id_5(
        .id_0(1 && id_1)
    );
  endgenerate
endmodule
module module_1 (
    input logic id_0,
    input wire id_1,
    output logic id_2,
    input wor id_3,
    input tri1 id_4,
    input tri0 id_5,
    input wire id_6,
    output supply0 id_7,
    input wand id_8,
    input tri1 id_9,
    input tri id_10,
    input tri id_11,
    input wire id_12
);
  always @(posedge id_8) begin : LABEL_0
    if (1) id_2 = 1;
    else if (1'b0) id_2 <= 1 && id_8;
    else begin : LABEL_0
      assume (id_8);
      #1 id_2 <= 1'd0;
      if (1) begin : LABEL_0
        #1;
        if (1) id_2 <= 1;
      end else if (1) id_2 <= #1 1;
      else id_2 <= id_0 & id_12;
    end
  end
  always force id_7 = id_0;
  wire id_14;
  module_0 modCall_1 (
      id_14,
      id_14,
      id_14,
      id_14
  );
  assign modCall_1.id_1 = 0;
  wire id_15;
endmodule
