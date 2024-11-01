// Seed: 3557833989
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    for (id_4 = 1; 1; id_2 = id_4) begin : id_5
      id_6(
          .id_0(id_5), .id_1(1), .id_2(id_3), .id_3(1)
      );
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_3 or id_3) begin
    id_4 <= id_3;
    id_2 <= #id_3 id_3;
    if (id_3 === 1 < "") begin
      id_4 = 1 * id_3;
    end else begin
      id_4 <= 1;
      if (id_3 % 1'b0) begin
        #1;
      end else assume ({id_3} == (id_1));
    end
  end
  wire id_6, id_7;
  module_0(
      id_1, id_6, id_7
  );
endmodule
