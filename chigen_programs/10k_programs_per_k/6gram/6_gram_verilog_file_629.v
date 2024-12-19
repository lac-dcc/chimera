// Seed: 2200444248
module module_0;
  assign id_1 = 1 ? 1 : 1;
  always @(~id_1 or posedge 1 * id_1)
    if (id_1) {id_1, 1'h0} <= id_1;
    else id_1 <= id_1;
endmodule
module module_1 (
    inout  logic id_0,
    input  tri0  id_1,
    input  logic id_2,
    output logic id_3,
    output logic id_4
);
  assign id_4 = id_2;
  assign id_3 = id_0;
  always @(*) begin : LABEL_0
    id_4 <= id_1 ==? id_2;
    id_3 = 1'b0;
    if (1 && id_0)
      if (1)
        #1 begin : LABEL_0
          id_0 = 1;
          id_3 <= 1;
          id_0 <= id_2;
        end
    id_0 <= 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
