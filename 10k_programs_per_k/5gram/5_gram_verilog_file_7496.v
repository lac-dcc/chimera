// Seed: 1800119946
module module_0 (
    id_1,
    id_2
);
  inout id_2;
  inout id_1;
  generate
    for (id_2 = 1; 1; id_1 = id_1) begin : id_3
      if (id_2)
        always @(posedge 1'b0 && 1'h0 && 1 && 1)
          if (1) begin
            if (id_2) begin
              if (1) id_2 <= id_1;
            end else begin
              id_1 <= id_2;
              SystemTFIdentifier(id_2);
            end
          end else begin
            id_2 <= 1;
            @(posedge 1);
            if (1'b0) begin
              SystemTFIdentifier;
            end
          end
    end
  endgenerate
endmodule
module module_1 (
    output logic id_0,
    input logic id_1,
    input id_2
);
  logic id_3;
  type_8 id_4 (
      .id_0(id_1),
      .id_1(id_1),
      .id_2(id_3)
  );
endmodule
