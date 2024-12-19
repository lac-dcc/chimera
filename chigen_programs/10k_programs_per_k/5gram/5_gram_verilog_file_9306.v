// Seed: 256156050
module module_0 ();
  assign id_1 = 1'b0 ? id_1 : (1'd0);
  assign id_1 = !id_1;
  assign id_1 = id_1 ? id_1 : 1;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    output logic id_2
);
  always @(id_0) begin : LABEL_0
    if ((1) - id_0)
      if (1) begin : LABEL_0
        id_1 = new("");
        #1;
        id_2 <= id_0;
        id_2 <= 1;
        if (1'b0) begin : LABEL_0
          if (id_0) id_1 <= 1'b0;
        end
      end else forever for (id_1 = 1; id_0 == 1; id_1 = id_0) #1 id_1 <= 1;
    else begin : LABEL_0
      id_2 = #id_4 id_4;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_5;
endmodule
