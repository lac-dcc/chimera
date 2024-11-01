// Seed: 1847850965
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_12;
  wire id_13;
  id_14(
      .id_0(id_4), .id_1(1), .id_2(), .id_3(), .id_4(1)
  );
  always @(posedge 1);
  assign id_1 = 1'b0;
  wire id_15;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  initial begin
    if (id_3[1'h0])
      fork : id_4
        id_4 <= 1;
        $display(1);
        id_1 = 1;
      join_any : id_5
    else if (id_4) disable id_6;
    else begin
      id_2 <= #id_3 1;
    end
  end
  wire id_7;
  module_0(
      id_7, id_7, id_7, id_1, id_7, id_7, id_7, id_7, id_7, id_7, id_7
  );
endmodule
