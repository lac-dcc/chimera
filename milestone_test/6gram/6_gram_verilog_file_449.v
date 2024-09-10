// Seed: 4225634747
module module_0 #(
    parameter id_9 = 32'd31
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output id_8;
  input id_7;
  output id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  output id_1;
  logic _id_9;
  reg   id_10;
  always @(negedge id_9) begin
    id_10 = id_4[id_9 : 1];
    if (id_5) begin
      id_1 <= id_6;
      id_1 <= 1;
    end else begin
      id_10 <= id_1[1];
    end
  end
endmodule
