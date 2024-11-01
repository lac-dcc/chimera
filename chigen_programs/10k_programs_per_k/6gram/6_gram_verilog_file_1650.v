// Seed: 1986974685
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = 1 == id_2;
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
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_10(
      .id_0(id_3[1]), .id_1(), .id_2(id_9), .id_3(id_4), .id_4(id_7), .id_5(id_1)
  ); module_0(
      id_7, id_6, id_8
  );
  wire id_11;
  always @(posedge id_5[1!=""+:1'b0] or posedge 1) begin
    $display(id_7);
    id_2 <= 1;
  end
  assign id_1 = id_7;
  id_12(
      .id_0(1), .id_1(id_8), .id_2(1), .id_3(id_9 == 1), .id_4(id_10)
  );
endmodule
