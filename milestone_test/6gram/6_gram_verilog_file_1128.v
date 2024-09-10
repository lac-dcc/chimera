// Seed: 852625109
`default_nettype wire
module module_0 #(
    parameter id_1 = 32'd77
);
  assign id_1[(id_1[1-1])] = id_1;
endmodule
module module_1 ();
  always @(id_1) begin
    id_1 <= 1;
    id_1[1] <= id_1;
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output id_5;
  input id_4;
  input id_3;
  output id_2;
  output id_1;
  logic id_6 = id_5;
  generate
    if (1) begin
      defparam id_7.id_8 = 1;
    end else begin : id_9
      defparam id_10.id_11 = 1;
      logic id_12 = id_12;
      assign id_1 = id_9 & 1;
    end
  endgenerate
endmodule
