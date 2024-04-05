`include "fulladder_32bit.v"
module test_32bitadder();

    reg [31:0] in1, in2;
    reg cin;

    wire [31:0] sm;
    wire cout;

    fulladder_32bit fa1( sm, cout, in1, in2, cin );

    initial
        $monitor(" in1 %b ", in1, "in2: %b ", in2, "sm: %b ", sm, "cout: ", cout);

    initial begin
        in1 = 32'hFFFFFF8E;
        in2 = 32'hFFFFFF56;
        cin = 0;
    end

endmodule