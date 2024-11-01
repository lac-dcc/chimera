// Seed: 1628219891
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always disable id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    .id_7(id_6)
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0(
      id_4, id_2, id_7, id_4, id_4, id_4, id_2
  );
  tri id_8;
  always @(posedge id_8 or 1'b0) begin
    fork
      begin
      end
      id_9;
    join
  end
  supply0 id_10;
  assign id_10 = 1;
  assign id_1  = 1;
  assign id_1  = id_7 == ~id_4;
  initial id_5 = #1 1;
endmodule
