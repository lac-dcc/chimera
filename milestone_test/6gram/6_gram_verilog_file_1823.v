// Seed: 3832275822
module module_0 (
    output id_2,
    output id_3,
    output reg id_4,
    input id_5,
    output id_6,
    input id_7,
    output logic id_8
);
  always @(id_1 or posedge 1) begin
    SystemTFIdentifier(1'b0, 1);
    id_2 <= 1;
    id_7 <= 1 & id_5;
    #1;
    #1;
    id_7[1] = 1;
    #1 id_1 = 1'b0;
    SystemTFIdentifier(id_6);
    #1;
    @(posedge 1);
    id_4 = 1'b0;
    id_7 = 1'h0;
    @(posedge 1 * 1'h0) #1;
    id_3 = 1;
    id_6 = id_5;
    id_6 = 1;
    id_5 <= id_5;
    if (1) id_2 <= 1;
    if (id_4) id_6 <= id_4;
    else begin
      if (1 == id_8) begin
        id_5 <= 1;
      end else begin
        if (id_8 && 1) begin
          id_1 = id_3;
        end
      end
    end
  end
endmodule
