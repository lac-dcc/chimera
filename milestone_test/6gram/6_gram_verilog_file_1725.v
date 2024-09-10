// Seed: 1573182859
module module_0 #(
    parameter id_8 = 32'd29,
    parameter id_9 = 32'd2
) (
    input id_1,
    input string id_2,
    input id_3,
    output id_4,
    output id_5,
    input id_6,
    output id_7
);
  always @(posedge id_2) begin
    id_6 = id_4;
    id_4 = id_5;
    id_6 <= id_4;
  end
  logic _id_8;
  assign id_5 = (id_6) & id_5 - 1'h0;
  always @(1 or posedge id_5) begin : _id_9
    id_5 <= id_3[id_9];
  end
  logic id_10;
  assign id_2[id_8] = "";
  always @(posedge id_1) begin
    if (id_1 && id_3 && 1'b0) begin
      id_3[1 : 1] = id_1;
      id_1 <= 1;
      id_1 = id_5;
    end
    id_8 <= id_8[1];
  end
endmodule
