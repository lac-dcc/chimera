localparam id_1 = id_1;
module module_0 (
    id_1,
    id_2,
    id_3
);
  input id_3;
  output id_2;
  input id_1;
  generate
    assign id_2 = id_1;
    if (id_2[id_2]) begin : id_4
      assign id_4[id_3] = id_3;
      id_5 id_6 (
          .id_3(1),
          .id_3(id_1),
          .id_2(id_4),
          .id_4(id_3),
          .id_4(id_4),
          .id_2(id_3[id_1 : id_3]),
          .id_3(id_2)
      );
    end else begin : id_7
      assign id_1 = id_1;
    end
  endgenerate
endmodule
