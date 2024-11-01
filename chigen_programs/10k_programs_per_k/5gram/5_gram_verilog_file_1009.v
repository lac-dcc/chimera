// Seed: 2286177948
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4;
endmodule
module module_1 ();
  wire id_1;
  module_0(
      id_1, id_1
  );
endmodule
module module_2 (
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
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = 1'b0;
  assign id_4 = 1;
  final begin
    #1;
    deassign id_1;
  end
  module_0(
      id_4, id_2
  );
  wand id_10;
  assign id_10 = !id_4;
  initial
    forever
      @(posedge 1, posedge 1'b0)
        if (id_4 + id_6 + id_3 + 1 - id_10 + 1'b0 + (1) - 1) begin
          assert (id_6);
        end else id_5 <= 1'b0;
  id_11(
      .id_0(id_2 == 1), .id_1(""), .id_2(1), .id_3(id_6)
  );
  assign id_7 = 1'b0;
endmodule
