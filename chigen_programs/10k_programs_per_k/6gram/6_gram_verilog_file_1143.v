// Seed: 3932676926
module module_0 ();
  wire id_1 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd92
) (
    input  tri   id_0,
    input  tri1  _id_1,
    input  wire  id_2,
    output logic id_3
);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  bit id_5;
  function automatic void id_6([id_1 : -1] id_7, input id_8);
    id_9(id_1 < 1);
    begin : LABEL_0
      $clog2(97);
      ;
      id_3 <= 1;
      id_5 = 1;
    end
  endfunction
  parameter id_10 = -1'b0;
  struct packed {logic [1 : 1] id_11;} id_12, id_13;
  always @(id_12 or posedge 1)
    if (id_10) begin : LABEL_1
      $clog2(26);
      ;
    end else id_12.id_11 <= 'b0;
  initial begin
    id_6();
  end
endmodule
