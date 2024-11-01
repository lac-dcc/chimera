// Seed: 568345098
module module_0;
  if ((id_1 >= 1'b0)) begin
    supply0 id_3;
    wire id_4;
    begin : id_5
      id_6(
          .id_0(!id_3), .id_1(1)
      );
    end
  end else if (id_1) begin
    wire id_7;
  end
  module_2();
endmodule
module module_1;
  wire id_1;
  module_0();
  wire id_2;
  supply0 id_3 = 1;
endmodule
module module_2 ();
  specify
    (id_1 => id_2) = 1;
    (id_3 => id_4) = (~id_3 > id_4++, 1'd0 : id_3 == 1  : 1);
    (id_5 *> id_6) = 1;
  endspecify
endmodule
