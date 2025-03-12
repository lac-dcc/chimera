// Seed: 1624954863
module module_0 (
    input  wire  id_0,
    output logic id_1,
    output logic id_2
);
  always @(*) begin : LABEL_0
    id_1 <= id_0;
    if ((1 ? -1'b0 : 1))
      if (1) id_2 <= -1 ? id_0 : -1 >> id_0;
      else if (1) begin : LABEL_1
        id_1 = id_0;
        id_1 <= id_0;
        if (-1) begin : LABEL_2
          id_1 <= id_0;
        end
      end else begin : LABEL_3
        id_1 <= ~-1;
        id_1 = 1;
        id_1 = id_0;
      end
  end
  assign id_1 = -1;
  assign module_1.id_3 = 0;
  supply1 [(  (  1  )  ) : 1] id_4 = 1'h0;
endmodule
module module_1 (
    output logic id_0,
    input  tri1  id_1
);
  reg id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0
  );
  initial begin : LABEL_0
    id_0 <= id_3;
    if (1) id_3 <= id_3 ^ id_1;
    else id_0 <= 1;
  end
endmodule
