// Seed: 3191833957
module module_0 #(
    parameter id_2 = 32'd68,
    parameter id_3 = 32'd67,
    parameter id_4 = 32'd29
) (
    id_1,
    _id_2,
    _id_3,
    _id_4,
    id_5
);
  input id_5;
  input _id_4;
  input _id_3;
  output _id_2;
  input id_1;
  assign id_5 = 1;
  assign id_4 = id_3[1];
  assign id_1[id_4] = 1'b0;
  assign id_3[id_3] = 1;
  always @(posedge 1) begin
    if (id_5) begin
      if (id_1[id_2] | id_4) begin
        id_5 <= "";
      end else begin
        id_4[id_3 : 1] = id_4;
      end
    end else id_4 <= 1'b0;
  end
endmodule
