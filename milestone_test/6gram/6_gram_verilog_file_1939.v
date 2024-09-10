// Seed: 2572620411
module module_0 #(
    parameter id_3 = 32'd24,
    parameter id_6 = 32'd43,
    parameter id_7 = 32'd70
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    _id_7,
    id_8
);
  input id_8;
  input _id_7;
  output _id_6;
  output id_5;
  input id_4;
  input _id_3;
  input id_2;
  input id_1;
  initial begin
    id_4 <= 1;
    id_5 = id_1;
  end
  assign id_6[id_7] = id_6 ? id_5[id_3] : id_3;
  logic id_9;
  always @(id_2 or posedge 1'b0 == id_4) begin
    id_10(id_2, 1);
    if (id_7) begin
      id_9 = (id_2);
      id_1[1] <= id_4 && 1'b0;
      if (1) begin
        id_6 <= 1;
      end else begin
        id_7 = id_7;
      end
      id_7 <= (1) == id_2;
      SystemTFIdentifier(1);
    end
    id_4 <= 1;
    id_10[id_6] = 1;
    SystemTFIdentifier(1, id_2);
    id_2 = id_2;
    id_1[1] <= 1;
    id_3 <= (id_3);
    id_4 <= 1'd0;
  end
endmodule
