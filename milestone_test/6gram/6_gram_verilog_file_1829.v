// Seed: 2089569065
module module_0 #(
    parameter id_3 = 32'd97
) (
    input logic id_1,
    input id_2,
    input _id_3,
    output id_4
);
  assign id_1[id_3==1'b0] = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output id_10;
  input id_9;
  input id_8;
  output id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  input id_2;
  input id_1;
  assign id_5[1'h0] = 1 - id_4;
  initial begin
    if (SystemTFIdentifier()) begin
      id_7 <= 'b0;
    end else begin
      id_1 = id_6;
      SystemTFIdentifier(id_2 ^ id_9, "");
    end
  end
endmodule
