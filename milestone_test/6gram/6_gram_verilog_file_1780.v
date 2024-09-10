// Seed: 3312787426
module module_0 #(
    parameter id_1 = 32'd18,
    parameter id_2 = 32'd28
) (
    _id_1,
    _id_2
);
  input _id_2;
  input _id_1;
  assign id_1[1] = id_2;
  assign id_2 = id_1;
  always @(posedge id_1[id_2 : 1'h0] or posedge 1) begin
    id_1 <= id_1[1+:id_2];
    id_1 <= id_2;
    id_1 = id_1[id_1];
    id_1 = id_1;
  end
endmodule
