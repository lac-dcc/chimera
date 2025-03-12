// Seed: 703756715
module module_0;
  logic [1 : -1] id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output reg id_2;
  input wire id_1;
  module_0 modCall_1 ();
  generate
    for (id_4 = 1; -1; id_2 = id_4) begin : LABEL_0
      genvar id_5;
      always @(posedge id_5) begin : LABEL_1
        if (-1'b0) begin : LABEL_2
          id_5 <= id_3;
          id_4 <= id_1;
        end
      end
    end
  endgenerate
  always @(posedge id_3) id_4 = id_1;
  always @(id_1 or posedge id_3) begin : LABEL_3
    id_2 = 1;
  end
endmodule
