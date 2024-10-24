// Seed: 4290309113
module module_0 (
    output id_0,
    output id_1,
    input  id_2,
    input  id_3,
    input  id_4
);
  type_11(
      id_3[1'b0], id_0, 1, 1
  );
  logic id_5;
  logic id_6, id_7;
  always @(posedge 1'b0) begin
    SystemTFIdentifier(1, id_7, 1, id_2, id_6, id_5, 1, 1'b0, id_6, id_5, id_6, 1);
  end
  generate
    if (id_4) logic id_8;
    else begin
      logic id_9, id_10;
      always @(id_10 or posedge 1'b0) id_0 <= #id_9 1;
    end
  endgenerate
  timeprecision 1ps;
endmodule
