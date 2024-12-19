// Seed: 3771603611
module module_0 (
    input uwire id_0,
    input tri1  id_1,
    input wire  id_2
);
  wire id_4;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input wand id_2,
    input logic id_3,
    output logic id_4,
    input tri0 id_5,
    input logic id_6,
    input logic id_7
);
  id_9(
      id_6, id_4, 1, 1'b0 ==? 1'h0, id_7
  );
  assign id_4 = 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1
  );
  assign modCall_1.type_2 = 0;
  always @(posedge id_0)
    if (1) begin : LABEL_0
      id_4 <= id_7;
      if (id_6) begin : LABEL_0
        id_4 <= id_1 & 1'b0;
      end
    end else begin : LABEL_0
      if (id_7 - 1) begin : LABEL_0
        id_4 = #1 id_3;
      end
    end
endmodule
