// Seed: 218428714
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
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = 1;
  id_10(
      .id_0(1), .id_1(1)
  );
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd24,
    parameter id_7 = 32'd95
) ();
  reg  id_1;
  wire id_2;
  task id_3;
    begin : LABEL_0
      @(1 - id_2);
    end
    begin : LABEL_0
      id_1 <= id_1;
    end
    if (id_3)
      assert (1 ? id_1 : id_1++ ? 1'b0 : 1);
      else #1;
    id_2 = 1 - id_2 == 1;
  endtask
  wire id_5;
  defparam id_6.id_7 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_5,
      id_5,
      id_5,
      id_3
  );
  wire id_8;
  wire id_9;
  wire id_10;
endmodule
