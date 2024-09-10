// Seed: 1438693644
module module_0 #(
    parameter id_3 = 32'd58
) (
    id_1,
    id_2,
    _id_3
);
  input _id_3;
  output id_2;
  output id_1;
  initial begin
    if (id_1)
      if (id_3) begin
        id_3 <= #1 1;
        id_1 <= {id_1 - id_1 / id_2, id_2} * id_2(~id_1[id_3+:1]);
      end
    id_3 = 1;
  end
endmodule
