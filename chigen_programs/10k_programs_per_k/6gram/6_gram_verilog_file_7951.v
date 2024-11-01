// Seed: 4018282218
module module_0 ();
  always @(id_1 or negedge 1'h0 or negedge 1) begin
    id_1 <= 1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    output wire id_2
);
  wire id_4;
  module_0();
  wire id_5;
endmodule
module module_2 (
    input supply1 id_0,
    output wire id_1,
    output tri0 id_2,
    input supply0 id_3
);
  initial begin
    $display(1);
    id_1 = 1'h0;
  end
  buf (id_1, id_3);
  module_0();
endmodule
module module_3 (
    output logic id_0,
    input  tri   id_1,
    input  tri1  id_2,
    input  logic id_3,
    input  uwire id_4
);
  wire  id_6;
  module_0();
  uwire id_7;
  supply0 id_8, id_9;
  assign id_7 = id_3 == 1'b0;
  wire id_10;
  assign #id_11 id_7 = id_8;
  id_12(
      .id_0(1), .id_1(1), .id_2(1), .id_3(1), .id_4(id_7)
  );
  initial id_0 <= id_3;
endmodule
