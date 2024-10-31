// Seed: 3275353175
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
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    assign id_7 = id_6 < id_5;
    assign id_7 = (1'b0);
    assign id_1 = id_3;
    for (id_10 = 1; 1; id_7 = 1'b0) begin : id_11
      wire id_12;
    end
  endgenerate
  initial
  fork : id_13
  join_any
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_2) begin
    id_4 <= 1;
  end
  module_0(
      id_1, id_3, id_5, id_5, id_1, id_2, id_1, id_5, id_2
  );
endmodule
