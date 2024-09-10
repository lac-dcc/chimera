// Seed: 1901625628
module module_0 #(
    parameter id_1 = 32'd72,
    parameter id_2 = 32'd36
) (
    _id_1,
    _id_2,
    id_3,
    id_4
);
  input id_4;
  input id_3;
  output _id_2;
  input _id_1;
  assign id_3[1'b0] = 1;
  assign id_1[id_2] = id_4;
  always @(posedge id_3 or negedge (1))
    if (1) id_3[id_2[1] : id_1] = 1'b0;
    else begin
      id_2 <= 1;
      SystemTFIdentifier(id_1);
      #1;
      id_1[id_2 : 1] = 1;
      id_4 <= 1 << 1;
      id_2 = 1;
      SystemTFIdentifier(1, 1'd0);
    end
endmodule
