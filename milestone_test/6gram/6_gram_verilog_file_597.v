// Seed: 1624295180
module module_0 #(
    parameter id_5 = 32'd67
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  input _id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  reg id_6;
  assign #id_7 id_4[id_5] = 1;
  assign id_6 = id_4[id_5] == 1;
  reg id_8;
  assign id_5[1-1] = 1'd0;
  always @(posedge id_5) begin
    #1 id_2 = 'b0;
    id_4 = 1;
    id_6 <= 1'b0 - 1;
    id_4 <= id_8[id_5-1'b0];
    id_8 <= 1;
  end
endmodule
