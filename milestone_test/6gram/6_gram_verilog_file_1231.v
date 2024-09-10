// Seed: 1255561362
module module_0 #(
    parameter id_1 = 32'd95,
    parameter id_3 = 32'd82
) (
    _id_1,
    id_2,
    _id_3,
    id_4
);
  output id_4;
  input _id_3;
  input id_2;
  input _id_1;
  always @(*) id_3 <= id_2;
  assign id_4 = id_1 ^ {id_2, -id_3 | id_2} / id_1;
  logic id_5;
  assign id_4[""] = 1 ? id_2 : 1 ? 1 : 1;
  type_10 id_6 (
      .id_0(id_5),
      .id_1(1'b0),
      .id_2(id_3),
      .id_3(1),
      .id_4(id_3),
      .id_5(id_4[id_3]),
      .id_6(id_4[id_1]),
      .id_7("" - id_2)
  );
  reg id_7, id_8;
  always @(posedge id_7 or posedge (1) == 1)
    if ((1)) id_7 <= 1;
    else id_7 <= id_4;
endmodule
