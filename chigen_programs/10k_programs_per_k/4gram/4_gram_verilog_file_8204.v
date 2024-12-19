// Seed: 1529604923
module module_0 (
    output logic id_0,
    input  logic id_1,
    output logic id_2,
    input  logic id_3
);
  always @(id_1) begin : LABEL_0
    begin : LABEL_0
      assign id_0 = id_3;
    end
    id_2 <= id_1;
    id_0 = id_1;
    #1 begin : LABEL_0
      id_0 <= 1 & id_3;
      if (1) begin : LABEL_0
        id_0 <= id_3;
        id_2 <= 1;
      end else id_2 <= 1'h0;
    end
    id_0 <= 1;
    id_0 <= 1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1,
    input logic id_2,
    output logic id_3,
    output wor id_4,
    input logic id_5,
    input supply1 id_6
);
  assign id_0 = id_6;
  tri   id_8;
  logic id_9 = id_5;
  always @(posedge id_2 or 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_3 <= id_2;
    end else begin : LABEL_0
      if (1'b0 ^ id_8) id_9 <= id_9;
    end
  end
  wire id_10;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_9
  );
  assign modCall_1.id_3 = 0;
  assign {1, 1 == id_6} = id_6;
  or primCall (id_1, id_6, id_5, id_2, id_10, id_8);
endmodule
