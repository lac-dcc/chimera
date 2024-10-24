// Seed: 2398511979
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
  input id_6;
  output id_5;
  output id_4;
  inout id_3;
  output id_2;
  output id_1;
  generate
    if (1) begin : id_7
      assign id_5 = id_6[1];
      assign id_3 = 1;
    end else begin
      type_9 id_8 (
          .id_0(1),
          .id_1(1'h0),
          .id_2(id_1),
          .id_3(id_6),
          .id_4(1),
          .id_5(1 - id_7 & 1)
      );
    end
  endgenerate
endmodule
