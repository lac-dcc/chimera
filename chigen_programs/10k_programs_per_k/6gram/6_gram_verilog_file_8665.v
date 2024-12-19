// Seed: 1407682473
module module_0;
  logic [7:0] id_1 = id_1;
  assign module_2.type_4 = 0;
  assign module_1.type_1 = 0;
  assign id_1[1] = id_1;
  wire id_3;
endmodule
module module_1 #(
    parameter id_10 = 32'd98,
    parameter id_9  = 32'd24
) (
    output tri0  id_0,
    output tri1  id_1,
    output tri   id_2,
    input  uwire id_3,
    output tri   id_4,
    input  uwire id_5,
    input  wire  id_6,
    output tri0  id_7
);
  defparam id_9.id_10 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2
);
  assign id_2 = id_1;
  assign id_2 = id_1 && id_0;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    {id_1, id_0} += id_1 != 1;
    id_2 <= id_1 ? !id_1 : 1;
    id_2 <= 1;
    if (id_0) begin : LABEL_0
      id_2 = {1, 1'b0, 1'd0} && id_0 == id_1;
      id_2 = 1;
    end else begin : LABEL_0$display
      ;
      disable id_1;
    end
  end
endmodule
