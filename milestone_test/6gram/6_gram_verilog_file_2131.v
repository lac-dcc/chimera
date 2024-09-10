// Seed: 203533632
module module_0 #(
    parameter id_1 = 32'd62,
    parameter id_2 = 32'd23
) (
    _id_1,
    _id_2
);
  output _id_2;
  input _id_1;
  always @(posedge id_1) begin
    id_1 = 1;
    id_1 <= 1'b0;
    id_1[id_2] <= 1 ? id_2 : 1;
    id_1 <= id_1[id_2[id_1[id_2] : id_1] : 1];
    case (1)
      1'h0: id_1 = 1;
      'h0:  id_2 = (id_2);
      1'b0: id_2#(.id_2(1), .id_2("")) = id_1;
      id_2: id_1 <= id_1;
    endcase
  end
  logic id_3;
  assign id_1[1] = id_1[1];
endmodule
