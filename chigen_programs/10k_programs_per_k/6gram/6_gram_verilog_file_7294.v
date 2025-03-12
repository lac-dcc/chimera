// Seed: 4085701728
module module_0 (
    input  wire  id_0,
    input  wand  id_1,
    output logic id_2
);
  always @(posedge id_1) begin : LABEL_0
    id_2 <= #1 1'h0;
    id_2 = 1'b0;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output logic id_2
);
  generate
    if (-1'b0) begin : LABEL_0
      assign id_2 = 1 ? id_1 : id_0 + -1;
    end else begin : LABEL_1
      always @(1 or posedge id_1) begin : LABEL_2
        id_2 <= 1;
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2
  );
endmodule
