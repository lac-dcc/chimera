// Seed: 3234439589
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input id_7;
  inout id_6;
  inout id_5;
  inout id_4;
  output id_3;
  output id_2;
  output id_1;
  type_8 id_7 (
      .id_0(id_5),
      .id_1(id_6),
      .id_2(1),
      .id_3(id_2),
      .id_4(id_6),
      .id_5(1),
      .id_6(id_3),
      .id_7({id_3{1}}),
      .id_8(id_1),
      .id_9(1)
  );
  always @(negedge 1) begin
    if (id_5 + 1) begin
      SystemTFIdentifier(1'h0, id_5);
      SystemTFIdentifier(id_6);
      id_6 = 1'b0;
    end
  end
endmodule
`default_nettype wire
