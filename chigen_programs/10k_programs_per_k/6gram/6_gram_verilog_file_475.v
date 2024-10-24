// Seed: 1574495374
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input id_4;
  input id_3;
  inout id_2;
  output id_1;
  reg id_4;
  integer id_5;
  type_8 id_6 (
      .id_0(id_1),
      .id_1(id_4),
      .id_2(id_2),
      .id_3(1 - id_4),
      .id_4(1),
      .id_5(!id_2),
      .id_6(""),
      .id_7(!id_3)
  );
  always @(posedge ~id_5 or id_6) begin
    for (id_4 = 1; 1; id_4 = 1'b0) for (id_1 = (1); 1; id_4 = id_2) id_2 <= 1;
  end
  always @(*) id_5 <= #1 1'h0;
endmodule
