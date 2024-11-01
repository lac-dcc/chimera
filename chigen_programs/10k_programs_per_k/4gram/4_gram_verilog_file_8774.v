// Seed: 1022522571
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_9;
  always @*
    if (id_6) begin
      cover (1'h0);
    end else begin
      id_9 = id_9;
      id_9 <= 1'h0;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = id_5 ? 1'b0 : id_9;
  xnor (id_10, id_5, id_9, id_4, id_8, id_3, id_7);
  module_0(
      id_2, id_6, id_5, id_9, id_5, id_8, id_7, id_10
  );
endmodule
