// Seed: 1255120032
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output id_9;
  input id_8;
  input id_7;
  input id_6;
  output id_5;
  output id_4;
  output id_3;
  input id_2;
  input id_1;
  type_14(
      id_5, id_2
  );
  generate
    assign id_3 = id_9;
    for (id_10 = 1; 1; id_9 = id_1) begin : id_11
      for (id_12 = 1; id_4; id_11 = 1) begin : id_13
        assign id_8 = id_13;
        always @(posedge id_9 or posedge id_11) if (1) id_12 = 1;
      end
    end
  endgenerate
endmodule
