// Seed: 2224009759
module module_0 #(
    parameter id_1  = 32'd15,
    parameter id_11 = 32'd70,
    parameter id_4  = 32'd13,
    parameter id_8  = 32'd26
) (
    _id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  output _id_8;
  output id_7;
  input id_6;
  input id_5;
  input _id_4;
  input id_3;
  output id_2;
  input _id_1;
  assign (pull1, weak0) id_7 = id_3;
  initial begin
    id_6 <= id_5;
    if (1'b0) id_6 <= #id_9 id_2;
  end
  defparam id_10._id_11 = id_7[id_4.id_11.id_4[id_8]];
  reg id_12 = id_12[1 : id_1];
  always @(1 or id_3 ^ 1) begin
    id_6 <= id_12;
  end
  always @(posedge id_7 or posedge 1 - id_5)
    if (id_12[1]) begin
      id_1 <= 1;
    end else begin
      id_8 <= id_1 ? id_1 : id_4 - id_1[id_8&1];
      SystemTFIdentifier(id_4[1] & 1, id_2 - id_4);
    end
  assign id_3 = id_10;
  always @((1'b0) or 1 >= id_1[id_4]) begin
    id_1 = id_7 & id_11 & id_12 == -id_1[1 : 1] & (id_7 ? 0 : 1) & 1'h0 & id_2;
  end
endmodule
