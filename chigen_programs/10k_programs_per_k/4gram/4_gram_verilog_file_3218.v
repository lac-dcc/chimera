// Seed: 2991018580
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  id_7(
      .id_0(1'h0), .id_1(1), .id_2(id_2 <= 1'b0)
  );
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    input  logic id_2
);
  logic id_4;
  assign id_4 = id_4 ? id_4 : id_2;
  always @(posedge id_1 or posedge 1 | 1 & id_2) begin : LABEL_0
    if (~1) id_0 <= id_4;
    else disable id_5;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
