// Seed: 1429094498
module module_0 (
    input id_0,
    output reg id_1,
    output id_2,
    inout reg id_3
);
  reg id_4 = id_3;
  assign id_3 = id_4 && id_3 && id_3;
  type_11(
      1, id_3, 1, id_1
  );
  logic id_5;
  generate
    genvar id_6;
    for (id_7 = id_3; 1; id_3 = id_7) begin
      always @(1) begin
        id_1 <= {{id_3{~id_5}} {id_0}} - 1 | 1;
      end
    end
  endgenerate
endmodule
