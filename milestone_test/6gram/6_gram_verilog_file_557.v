// Seed: 2694875286
module module_0 #(
    parameter id_8 = 32'd42
) (
    input reg id_1,
    input id_2,
    input id_3,
    input id_4
);
  reg id_5;
  reg id_6 = id_1;
  assign id_5 = id_2;
  assign id_6 = 1;
  type_15(
      id_3, id_5, id_4, id_5, 1 * 1
  );
  always @(id_4) begin
    id_5 <= id_1[1] & id_2 & id_6 & 1;
    id_6 <= 1;
  end
  logic id_7;
  assign id_2 = id_5 - {1'b0, 1, 1};
  logic  _id_8;
  string id_9;
  assign id_1[1'b0] = id_5;
  logic id_10;
  assign id_3 = 1;
  type_19 id_11 (
      .id_0(id_1),
      .id_1(id_1[1]),
      .id_2(id_4),
      .id_3(id_1[id_8]),
      .id_4(id_4)
  );
  always @(negedge id_2[1])
    case (id_4)
      ((1) - 1): id_3 = 1;
      default:   id_9 = "";
    endcase
endmodule
